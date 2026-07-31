#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
gen_cloudfront_split.py —— 从 AWS 官方 ip-ranges.json 把 CloudFront / Global Accelerator 段按用途拆开。
（已实测：Loyalsoldier v2ray-rules-dat 的 cloudfront == AWS 官方 CLOUDFRONT+ORIGIN_FACING，覆盖 IP 100% 相同，
  故直接用官方源，更权威、且自带 region/GLOBAL 标签。）

拆成 4 类原始素材（纯数据；怎么并进流量区块由上层 yaml 决定，本脚本不认识 FA/区域分区）：
  1) cloudfront_global.txt         service=CLOUDFRONT 且 region=GLOBAL 的**全局边缘池**（面向客户端）。
                                   各国 POP 的 /24 都从这个池里分，geoip 常标错国家 —— 这是**唯一需要探测**的
                                   部分，交给 gen_cloudfront_pop.py（快版）/ gen_cloudfront_pop_full.py（全量版）。
  2) cloudfront_region/<cc>.txt    service=CLOUDFRONT 且 region 是具体区域（非 GLOBAL）的段，按国家细分。
                                   region 是地理固定单播、AWS 已标好，**权威、无需探测**（独立存放，能细分尽量细分）。
  3) cloudfront_origin_facing.txt  service=CLOUDFRONT_ORIGIN_FACING（CloudFront 边缘**回源出口**段，不是客户端入口）。
                                   存档/备查，一般不进客户端路由。
  4) ga_anycast.txt                service=GLOBALACCELERATOR（GLOBAL + 各 region 段一起）。GA 是**真 anycast**：
                                   静态 anycast IP、BGP 就近入网（和 Cloudflare/GFE 同机制，见文件末官方链接），
                                   同一 IP 全球通告、香港访问天然就近，**不需要也无法按国家分/探** —— 整体存档、就近直连。

region->国家复用 gen_aws_region.AWS_REGION2CC；下载/落盘复用 gen_aws_region / gen_cloudfront_pop。
退化：ip-ranges.json 拉不到 -> 告警、exit 0、不落文件，不阻断打包。

GA 是真 anycast 的官方依据：
  https://docs.aws.amazon.com/global-accelerator/latest/dg/introduction-how-it-works.html
    “The static IP addresses are anycast from the AWS edge network.”
  https://aws.amazon.com/blogs/networking-and-content-delivery/traffic-management-with-aws-global-accelerator/
    “…routed to a nearby Global Accelerator edge location over the public internet via the Anycast BGP protocol.”
"""

import argparse
import ipaddress
import os
import sys

import cdn_common as common        # 复用 write_nets
import gen_aws_region as awsr       # 复用 AWS_REGION2CC / load_ranges / DEFAULT_URL

for _s in (sys.stdout, sys.stderr):
    try:
        _s.reconfigure(encoding="utf-8")
    except Exception:  # noqa: BLE001
        pass


def collect(obj):
    """遍历 ip-ranges.json -> (global_nets, region_by_cc, origin_facing_nets, ga_nets, unknown_regions)。"""
    g, ofa, ga = [], [], []
    region_by_cc = {}
    unknown = set()
    for key, field in (("prefixes", "ip_prefix"), ("ipv6_prefixes", "ipv6_prefix")):
        for p in obj.get(key, []):
            cidr = p.get(field)
            svc = p.get("service")
            region = p.get("region") or ""
            if not cidr:
                continue
            try:
                net = ipaddress.ip_network(cidr, strict=False)
            except ValueError:
                sys.stderr.write(f"[WARN] 跳过非法前缀: {cidr}\n")
                continue
            if svc == "CLOUDFRONT":
                if region == "GLOBAL":
                    g.append(net)
                else:
                    cc = awsr.AWS_REGION2CC.get(region)
                    if not cc:
                        unknown.add(region)
                        continue
                    region_by_cc.setdefault(cc, []).append(net)
            elif svc == "CLOUDFRONT_ORIGIN_FACING":
                ofa.append(net)
            elif svc == "GLOBALACCELERATOR":
                ga.append(net)
    return g, region_by_cc, ofa, ga, unknown


def main():
    ap = argparse.ArgumentParser(
        description="从 ip-ranges.json 拆 CloudFront(global/region/origin-facing) 与 Global Accelerator(anycast)")
    ap.add_argument("--aws-json", default=awsr.DEFAULT_URL, help="ip-ranges.json 的本地路径或 URL（默认官方）")
    ap.add_argument("--out-global", required=True, help="cloudfront_global.txt（唯一需要探测的输入）")
    ap.add_argument("--out-region-dir", required=True, help="cloudfront_region/ 目录（按国家，权威）")
    ap.add_argument("--out-origin-facing", required=True, help="cloudfront_origin_facing.txt（回源出口，存档）")
    ap.add_argument("--out-ga", required=True, help="ga_anycast.txt（真 anycast，就近直连，存档）")
    args = ap.parse_args()

    obj = awsr.load_ranges(args.aws_json)
    if not obj:
        return 0  # 退化：不阻断打包

    g, region_by_cc, ofa, ga, unknown = collect(obj)
    if unknown:
        sys.stderr.write(f"[WARN] CLOUDFRONT 里这些 region 不在 AWS_REGION2CC（已跳过，可补表）: "
                         f"{', '.join(sorted(unknown))}\n")

    gm = common.write_nets(args.out_global, g)
    sys.stderr.write(f"[OK] cloudfront_global（需探测）: {len(gm)} 条 -> {args.out_global}\n")

    os.makedirs(args.out_region_dir, exist_ok=True)
    rtot = 0
    for cc, nets in sorted(region_by_cc.items()):
        m = common.write_nets(os.path.join(args.out_region_dir, f"{cc.lower()}.txt"), nets)
        rtot += len(m)
        sys.stderr.write(f"[OK] cloudfront_region/{cc.lower()}: {len(m)} 条\n")
    sys.stderr.write(f"[OK] cloudfront_region 合计 {rtot} 条 / {len(region_by_cc)} 国 -> {args.out_region_dir}\n")

    om = common.write_nets(args.out_origin_facing, ofa)
    sys.stderr.write(f"[OK] cloudfront_origin_facing（回源出口，存档）: {len(om)} 条 -> {args.out_origin_facing}\n")

    gam = common.write_nets(args.out_ga, ga)
    sys.stderr.write(f"[OK] ga_anycast（真 anycast、就近、不探不分国）: {len(gam)} 条 -> {args.out_ga}\n")

    sys.stderr.write("[DONE] CloudFront/GA 拆分完成。\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
