#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
gen_aws_region.py —— 把 AWS 官方 ip-ranges.json「按区域→国家」拆成每国/每区一个文件（权威，无需探测）。

为什么这个能直接按地理拆、而 CloudFront 不能
--------------------------------------------
  CloudFront 是边缘/anycast，同一段 IP 各地都可能就近落，geoip 常标错 -> 只能靠 x-amz-cf-pop 探。
  但 AWS 的**区域**（EC2/S3/… 所在的 region，如 ap-east-1）是**地理固定的单播**：ap-east-1 的机房就在
  香港，ap-northeast-1 在东京，us-east-1 在弗吉尼亚…… 而且 ip-ranges.json 每条前缀自带 `region`，
  所以直接读 JSON 就能权威地把 AWS 段按国家分好，不用连、不用猜，永远和 AWS 现状一致。

产出
----
  默认按国家：<out-dir>/<cc>.txt（ap-east-1 -> hk.txt，ap-northeast-1 -> jp.txt，us-* -> us.txt…）。
  --group region 则按区域：<out-dir>/<region>.txt（想区分 us-east / us-west 等更细粒度时用）。
  这些是「原始素材」，怎么并进流量区块由上层 yaml 决定；本脚本不认识 FA/区域分区。

刻意排除
--------
  service 为 CLOUDFRONT / GLOBALACCELERATOR 的前缀（边缘 + anycast，不是地理固定单播）——CloudFront 另由
  gen_cloudfront_pop*.py 按真实 POP 处理，别在这里当成某个 region 的机房段。

退化：ip-ranges.json 拉不到 -> 告警、exit 0、不落文件，不阻断打包。
"""

import argparse
import ipaddress
import json
import os
import sys

import cdn_common as common  # 复用 fetch / write_nets

DEFAULT_URL = "https://ip-ranges.amazonaws.com/ip-ranges.json"

# 非地理固定的服务：边缘 / anycast，不当作某 region 的机房段（CloudFront 另处理）
EDGE_SERVICES = {"CLOUDFRONT", "GLOBALACCELERATOR"}

# region 为这些值时表示「非某地机房」（全局/边缘），静默跳过，不当未知告警
NON_GEO_REGIONS = {"GLOBAL"}

# AWS region -> ISO2 国家。region 命名稳定；新开区补一行即可。查不到的 region 会告警并跳过。
AWS_REGION2CC = {
    # 美国（含 GovCloud；us-south-1 = Dallas）
    "us-east-1": "US", "us-east-2": "US", "us-west-1": "US", "us-west-2": "US",
    "us-gov-east-1": "US", "us-gov-west-1": "US", "us-south-1": "US",
    # 加拿大 / 墨西哥 / 南美（sa-east-1 = 圣保罗 BR；sa-west-1 = 圣地亚哥 智利）
    "ca-central-1": "CA", "ca-west-1": "CA", "mx-central-1": "MX",
    "sa-east-1": "BR", "sa-west-1": "CL",
    # 欧洲（eusc-de-east-1 = 主权云 Brandenburg 德国）
    "eu-west-1": "IE", "eu-west-2": "GB", "eu-west-3": "FR",
    "eu-central-1": "DE", "eu-central-2": "CH", "eusc-de-east-1": "DE",
    "eu-north-1": "SE", "eu-south-1": "IT", "eu-south-2": "ES",
    # 中东 / 以色列 / 非洲
    "me-south-1": "BH", "me-central-1": "AE", "il-central-1": "IL", "af-south-1": "ZA",
    # me-west-1：ip-ranges 里出现、但 AWS 官方 region 表暂无、国家归属未定 -> 先不映射（classify 会告警提示）
    # 东亚（ap-east-2 = 台北 台湾）
    "ap-east-1": "HK", "ap-east-2": "TW",
    "ap-northeast-1": "JP", "ap-northeast-2": "KR", "ap-northeast-3": "JP",
    # 东南亚 / 南亚 / 大洋洲（ap-southeast-6 = 奥克兰 新西兰）
    "ap-southeast-1": "SG", "ap-southeast-2": "AU", "ap-southeast-3": "ID",
    "ap-southeast-4": "AU", "ap-southeast-5": "MY", "ap-southeast-6": "NZ", "ap-southeast-7": "TH",
    "ap-south-1": "IN", "ap-south-2": "IN",
    # 中国（如需）
    "cn-north-1": "CN", "cn-northwest-1": "CN",
}


def load_ranges(src):
    """src 是本地路径就读文件，否则当 URL 拉。返回 dict；失败返回 None。"""
    try:
        if src and os.path.exists(src):
            with open(src, "r", encoding="utf-8") as fh:
                return json.load(fh)
        return json.loads(common.fetch(src).decode("utf-8", "ignore"))
    except Exception as exc:  # noqa: BLE001 - 拉取/解析任何异常都退化
        sys.stderr.write(f"[WARN] 读取 ip-ranges.json 失败，退化不落文件: {exc}\n")
        return None


def classify(obj, group):
    """group='country' -> 键是 cc；'region' -> 键是 region。返回 {key: [net,...]}, unknown_regions。"""
    # 先收集边缘服务占用的前缀，稍后从地理归类里剔除
    edge = set()
    for key, field in (("prefixes", "ip_prefix"), ("ipv6_prefixes", "ipv6_prefix")):
        for p in obj.get(key, []):
            if p.get("service") in EDGE_SERVICES:
                edge.add(p.get(field))

    by_key, unknown = {}, set()
    for key, field in (("prefixes", "ip_prefix"), ("ipv6_prefixes", "ipv6_prefix")):
        for p in obj.get(key, []):
            cidr = p.get(field)
            region = p.get("region") or ""
            if not cidr or cidr in edge or region in NON_GEO_REGIONS:
                continue
            if group == "region":
                out_key = region
            else:
                cc = AWS_REGION2CC.get(region)
                if not cc:
                    unknown.add(region)
                    continue
                out_key = cc
            try:
                by_key.setdefault(out_key, []).append(ipaddress.ip_network(cidr, strict=False))
            except ValueError:
                sys.stderr.write(f"[WARN] 跳过非法前缀: {cidr}\n")
    return by_key, unknown


def main():
    ap = argparse.ArgumentParser(
        description="把 AWS ip-ranges.json 按区域→国家（或按区域）拆成每个一个文件（权威，无需探测）")
    ap.add_argument("--aws-json", default=DEFAULT_URL, help="ip-ranges.json 的本地路径或 URL（默认官方 URL）")
    ap.add_argument("--out-dir", required=True, help="每国/每区文件输出目录，如 .../mosdns_ip/aws_cc")
    ap.add_argument("--group", choices=("country", "region"), default="country",
                    help="country=按国家(默认)；region=按 AWS 区域(更细，如区分 us-east/us-west)")
    args = ap.parse_args()

    obj = load_ranges(args.aws_json)
    if not obj:
        return 0  # 退化：不阻断打包

    by_key, unknown = classify(obj, args.group)
    if unknown:
        sys.stderr.write(f"[WARN] 这些 AWS region 不在 AWS_REGION2CC（已跳过，可补表）: {', '.join(sorted(unknown))}\n")
    if not by_key:
        sys.stderr.write("[WARN] 没解析到任何可归类前缀，不落文件，exit 0\n")
        return 0

    os.makedirs(args.out_dir, exist_ok=True)
    total = 0
    for k, nets in sorted(by_key.items()):
        merged = common.write_nets(os.path.join(args.out_dir, f"{k.lower()}.txt"), nets)
        total += len(merged)
        sys.stderr.write(f"[OK] {k}: {len(merged)} 条 -> {args.out_dir}/{k.lower()}.txt\n")
    sys.stderr.write(f"[DONE] AWS 按 {args.group} 拆分完成（{len(by_key)} 个键 / {total} 条 -> {args.out_dir}）。\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
