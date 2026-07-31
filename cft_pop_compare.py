#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
cft_pop_compare.py —— 独立对照「快版(/24 假设) vs full 版(逐 IP 如实)」的 CloudFront POP 分类，
专门用来查快版 /24 假设的漏网/误判。与快版、full 版都解耦：**只读它们的产物 + full 的逐 IP 缓存，
自己不做任何探测**。（full 版只管全量抓取，对照全在这里，两者互不搞混。）

输入
----
  --quick-dir   快版输出目录 cloudfront_pop/          （每国 <cc>.txt，基于「一个 /24 = 一个 POP」）
  --full-dir    full 版输出目录 cloudfront_pop_full/   （每国 <cc>.txt + no_response.txt，逐 IP 如实）
  --full-cache  full 的逐 IP 缓存 cf_pop_full_cache.tsv（可选；ip<TAB>IATA。有它才能逐 /24 判「跨 POP」）
  --iata-db     机场库 CSV 本地路径（由 sh 统一 wget；配合 --full-cache 把 IATA->国家）

报告
----
  1) 每国 IP 数对照（换算成地址数，与 CIDR 粒度无关）：quick 总 / full 总 / 交集 / 仅quick / 仅full。
     「仅quick」通常来自快版把无响应 IP 也整段填了、或把跨 POP /24 整段误并成一国。
  2) 若给 --full-cache：逐 /24 统计**应答**国家集合，列出「跨 POP 的 /24」= 快版会整段误判的漏网点；
     为 0 则证明快版「一个 /24 = 一个 POP」假设全对。
只读、可离线（除非要现拉机场库）。
"""

import argparse
import ipaddress
import os
import sys

import cdn_common as common       # 复用 load_nets
import cft_pop_common as pop       # 复用 build_iata_db

for _s in (sys.stdout, sys.stderr):
    try:
        _s.reconfigure(encoding="utf-8")
    except Exception:  # noqa: BLE001
        pass


# --------------------------------------------------------------------------- #
# IPv4 区间集合运算（粒度无关地比较两边覆盖）
# --------------------------------------------------------------------------- #
def to_intervals(nets):
    iv = sorted((int(n.network_address), int(n.broadcast_address)) for n in nets if n.version == 4)
    merged = []
    for s, e in iv:
        if merged and s <= merged[-1][1] + 1:
            merged[-1][1] = max(merged[-1][1], e)
        else:
            merged.append([s, e])
    return [(s, e) for s, e in merged]


def total(iv):
    return sum(e - s + 1 for s, e in iv)


def subtract(a, b):
    """a - b；a、b 均为按起点排序的区间列表。"""
    res = []
    for s, e in a:
        cur = s
        for bs, be in b:
            if be < cur or bs > e:
                continue
            if bs > cur:
                res.append((cur, min(bs - 1, e)))
            cur = max(cur, be + 1)
            if cur > e:
                break
        if cur <= e:
            res.append((cur, e))
    return res


# --------------------------------------------------------------------------- #
# 读产物 / 读缓存
# --------------------------------------------------------------------------- #
def load_country_intervals(d):
    """读某目录里每国 <cc>.txt -> {cc: intervals}；跳过 no_response / unknown_iata 这类非国家文件。"""
    out = {}
    if not os.path.isdir(d):
        sys.stderr.write(f"[WARN] 目录不存在: {d}\n")
        return out
    for fn in sorted(os.listdir(d)):
        if not fn.endswith(".txt"):
            continue
        cc = fn[:-4].lower()
        if cc in ("no_response", "unknown_iata"):
            continue
        out[cc] = to_intervals(common.load_nets(os.path.join(d, fn)))
    return out


def find_mixed_24(cache_path, iata_db):
    """逐 /24 统计应答国家集合，返回按地址排序的 [(base24_int, {cc,...}), ...]（仅 len>1，即跨 POP）。"""
    by24 = {}
    with open(cache_path, "r", encoding="utf-8") as fh:
        for ln in fh:
            ln = ln.rstrip("\n")
            if "\t" not in ln:
                continue
            ip, iata = ln.split("\t", 1)
            iata = iata.strip()
            if not iata or iata == "-":
                continue
            cc = iata_db.get(iata)
            if not cc:
                continue
            try:
                p = int(ipaddress.IPv4Address(ip.strip()))
            except ValueError:
                continue
            by24.setdefault(p & 0xFFFFFF00, set()).add(cc)
    return sorted((b, ccs) for b, ccs in by24.items() if len(ccs) > 1)


def diff_countries(quick, full):
    """返回 [(cc, tq, tf, inter, only_q, only_f), ...]。"""
    rows = []
    for cc in sorted(set(quick) | set(full)):
        q = quick.get(cc, [])
        f = full.get(cc, [])
        only_q = total(subtract(q, f))
        only_f = total(subtract(f, q))
        rows.append((cc, total(q), total(f), total(q) - only_q, only_q, only_f))
    return rows


def main():
    ap = argparse.ArgumentParser(description="对照 快版 vs full 版 CloudFront POP 分类，查 /24 假设漏网/误判")
    ap.add_argument("--quick-dir", required=True, help="快版目录 cloudfront_pop/")
    ap.add_argument("--full-dir", required=True, help="full 版目录 cloudfront_pop_full/")
    ap.add_argument("--full-cache", default=None, help="full 的逐 IP 缓存（有它才做『跨 POP /24』检测）")
    ap.add_argument("--iata-db", default=None,
                    help="机场库 CSV 本地路径（由 sh 统一 wget；配合 --full-cache 把 IATA->国家）")
    args = ap.parse_args()

    quick = load_country_intervals(args.quick_dir)
    full = load_country_intervals(args.full_dir)

    print("== 每国 IP 数对照（地址数）：q=快版 f=full ∩=交集 q\\f=仅快版 f\\q=仅full ==")
    for cc, tq, tf, inter, oq, of in diff_countries(quick, full):
        flag = "  <-- 快版多算(无响应填充/跨POP误并?)" if oq else ""
        print(f"  {cc:4s} q={tq:>10,} f={tf:>10,} ∩={inter:>10,} q\\f={oq:>9,} f\\q={of:>9,}{flag}")

    if args.full_cache and os.path.exists(args.full_cache):
        iata_db = pop.build_iata_db(args.iata_db)
        mixed = find_mixed_24(args.full_cache, iata_db)
        print(f"\n== 跨 POP 的 /24（快版会整段误判的漏网点）：{len(mixed)} 个 ==")
        for b, ccs in mixed[:100]:
            print(f"  {ipaddress.IPv4Address(b)}/24 -> {sorted(ccs)}")
        if len(mixed) > 100:
            print(f"  ...（还有 {len(mixed) - 100} 个）")
        if not mixed:
            print("  ✓ 没有跨 POP 的 /24 —— 快版『一个 /24 = 一个 POP』假设全对，无漏网。")
    else:
        print("\n（未给 --full-cache，跳过『跨 POP /24』检测；要精确查漏网请带上 full 的缓存）")
    return 0


if __name__ == "__main__":
    sys.exit(main())
