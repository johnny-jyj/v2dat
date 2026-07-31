#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
gen_cloudfront_pop.py —— CloudFront「按真实 POP 国家分类」的**快版**（每 /24 探 1 个代表 IP）。

背景（为什么要这一步）：
  CloudFront 是「单播 + DNS 调度」CDN，每个边缘 POP 有各自 IP。geoip.dat 把大量 CloudFront 边缘段标错国家
  （典型：香港 POP 段 18.65.14.0/24 被标成 US）。CloudFront 每个 HTTP 响应头里带 `x-amz-cf-pop: HKG61-P1`
  （前 3 位 = IATA 机场码 = POP 城市），是权威信号。本脚本探每个 /24 的 POP -> IATA -> 国家。

快版策略：每个 /24 只探 1 个代表 IP，就把整段 /24 归给该 POP（省时，每次打包都能跑）。想验证这个「/24 假设」
  有没有漏网，用逐 IP 全量版 gen_cloudfront_pop_full.py + 对照脚本 cft_pop_compare.py。

分层（谁看都清楚，不再互相 import 可执行脚本）：
  - cdn_common      : load_nets / write_nets / …（通用 IP/IO）
  - cft_pop_common  : probe_pop / build_iata_db / IATA2CC（CloudFront POP 探测公共件）
  - 本脚本          : 只做快版特有的「枚举 /24 -> 并发探 -> 每国落文件」流程。

只处理 IPv4（/24 探测是 v4 概念；IPv6 段保持 geoip 原样）。
退化：拿不到机场库 CSV -> build_iata_db 直接报错退出(不退化)；一个 POP 都没探到 -> 告警、exit 0，不阻断打包。
"""
import argparse
import os
import sys
from concurrent.futures import ThreadPoolExecutor, as_completed

import cdn_common as common
import cft_pop_common as pop

for _stream in (sys.stdout, sys.stderr):
    try:
        _stream.reconfigure(encoding="utf-8")
    except Exception:  # noqa: BLE001 - 老 Python/重定向场景忽略
        pass


def enumerate_units(cf_path):
    """把 CloudFront IPv4 段展开成「探测单元」：>=/24 原样一条；</24 拆成 /24。
    返回 [(probe_ip_str, ipaddress.IPv4Network), ...]，按单元去重。"""
    units = {}
    for net in common.load_nets(cf_path):
        if net.version != 4:
            continue
        pieces = net.subnets(new_prefix=24) if net.prefixlen <= 23 else [net]
        for u in pieces:
            key = str(u)
            if key in units:
                continue
            host = u.network_address if u.num_addresses <= 2 else (u.network_address + 1)
            units[key] = (str(host), u)
    return list(units.values())


def classify(units, host, timeout, concurrency, iata_db):
    """并发探测。返回 {cc: [net,...]}, stats。"""
    by_cc = {}
    unknown_iata, no_resp = [], []

    def work(item):
        probe_ip, net = item
        return net, pop.probe_pop(probe_ip, host, timeout)

    done = 0
    total = len(units)
    with ThreadPoolExecutor(max_workers=concurrency) as ex:
        futs = [ex.submit(work, it) for it in units]
        for fut in as_completed(futs):
            done += 1
            if done % 1000 == 0:
                sys.stderr.write(f"[..] 探测进度 {done}/{total}\n")
            net, iata = fut.result()
            if not iata:
                no_resp.append(net)
                continue
            cc = iata_db.get(iata)
            if not cc:
                unknown_iata.append((iata, net))
                continue
            by_cc.setdefault(cc, []).append(net)

    stats = dict(total=total, resolved=sum(len(v) for v in by_cc.values()),
                 no_resp=len(no_resp), unknown_iata=len(unknown_iata))
    if unknown_iata:
        seen = sorted({i for i, _ in unknown_iata})
        sys.stderr.write(f"[WARN] 库/表都缺这些 IATA（未落文件，可补 cft_pop_common.IATA2CC）: {', '.join(seen)}\n")
    return by_cc, stats


def write_per_country(out_dir, by_cc):
    os.makedirs(out_dir, exist_ok=True)
    for cc, nets in sorted(by_cc.items()):
        n = common.write_nets(os.path.join(out_dir, f"{cc.lower()}.txt"), nets)
        sys.stderr.write(f"[OK] {cc}: {len(n)} 条 -> {out_dir}/{cc.lower()}.txt\n")


def main():
    ap = argparse.ArgumentParser(
        description="按 x-amz-cf-pop 把 CloudFront 段按真实 POP 国家分类，每国落一个文件（快版：每 /24 探 1 个）")
    ap.add_argument("--cloudfront-ip", required=True, help="要分类的 CloudFront 段（建议用 ⓪ 拆出的 cloudfront_global.txt）")
    ap.add_argument("--out-dir", required=True, help="每国原始文件输出目录（如 .../mosdns_ip/cloudfront_pop）")
    ap.add_argument("--host", default=pop.DEFAULT_HOST, help="探测用的 *.cloudfront.net（SNI/Host）")
    ap.add_argument("--iata-db", default=None,
                    help="机场库 CSV 本地路径（由 sh 统一 wget 下载；拿不到直接报错退出，不退化）")
    ap.add_argument("--concurrency", type=int, default=64)
    ap.add_argument("--timeout", type=float, default=5.0)
    args = ap.parse_args()

    units = enumerate_units(args.cloudfront_ip)
    if not units:
        sys.stderr.write("[WARN] cloudfront_ip 为空/不可读，跳过，exit 0\n")
        return 0

    iata_db = pop.build_iata_db(args.iata_db)
    sys.stderr.write(f"[..] 待探测 CloudFront /24 单元: {len(units)} 个，并发 {args.concurrency}\n")

    by_cc, stats = classify(units, args.host, args.timeout, args.concurrency, iata_db)
    sys.stderr.write(
        "[STAT] 单元={total} 命中={resolved} 无响应={no_resp} 未知IATA={unknown_iata}\n".format(**stats))

    if stats["resolved"] == 0:
        sys.stderr.write("[WARN] 一个 POP 都没探到（网络退化？），不落文件，exit 0\n")
        return 0

    write_per_country(args.out_dir, by_cc)
    sys.stderr.write(f"[DONE] CloudFront 按国家分类完成（{len(by_cc)} 个国家 -> {args.out_dir}）。\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
