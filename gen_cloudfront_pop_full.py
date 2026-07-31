#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
gen_cloudfront_pop_full.py —— CloudFront POP 分类的「逐 IP 如实版」（慢，低频单独跑，用于和快版对照）。

和快版 gen_cloudfront_pop.py 的关系（这版存在的唯一理由）
--------------------------------------------------------
  快版：每个 /24 只探 1 个代表 IP，就把**整段 /24**（含没探的 IP）归给那个 POP —— 这是「/24 假设」。
  本版：把每个 CloudFront IP 都探一遍，**只按实际探测结果落盘、绝不做 /24 假设**，从而当「标尺」去检验
        快版的 /24 假设到底对不对、有没有漏网。

落盘规则（严格如实，不推断）
----------------------------
  · 有响应：按 x-amz-cf-pop -> 国家，收 IP（/32），最后 collapse 成「能合多大合多大」的最大 CIDR。
  · 无响应（探了 443 但没拿到 cf-pop 的可用主机）：**单独写 no_response.txt**，绝不填给任何国家。
  · 探到 POP 但 IATA 查不到国家：写 unknown_iata.txt（供补 IATA2CC），也不塞进某国。
  · .0/.255：它们不是可分配主机（net.hosts() 本就不探），只做一件事——当某个 /24 内**应答 IP 全属同一国**时，
        把该 /24 的 .0/.255 也并给该国，好让相邻同国 /24 能向上合并成 /23、/22…（纯粹为合并，不算“假设某主机属某国”）。
        一旦该 /24 内应答 IP 出现两个国家（真跨 POP），就不桥接。

只做全量抓取，不做对照（对照是另一个独立脚本的事）
--------------------------------------------------
  本脚本**只负责**逐 IP 如实抓取 + 按国家分类 + no_response 单列，不掺任何「和快版对照」的逻辑。
  想查快版 /24 假设有没有漏网 / 是否全对，用独立脚本 cft_pop_compare.py（读本脚本产物 + --cache 即可），
  两者互不搞混：full 版 = 纯全量抓取；cft_pop_compare = 纯对照。

断点续跑（几百万探测必备）
--------------------------
  --cache 必填：每探完一个 IP 追加 "ip<TAB>IATA"（无响应记 "-"）；重跑跳过已探；随时 Ctrl-C 可续。
  合并阶段**流式读缓存**，内存主要花在「已探 IP 整数集合」。只处理 IPv4。
  探测/IATA映射复用 cft_pop_common，IP/IO 复用 cdn_common（都在同目录，不再 import 快版脚本）。
"""

import argparse
import bisect
import ipaddress
import itertools
import os
import sys
import threading
import time
from concurrent.futures import ThreadPoolExecutor, as_completed

import cdn_common as common       # load_nets / write_nets（通用 IP/IO）
import cft_pop_common as pop       # probe_pop / build_iata_db / DEFAULT_HOST（CloudFront POP 探测）

CHUNK = 20000
FLUSH_EVERY = 2000
PROGRESS_EVERY = 20000


# --------------------------------------------------------------------------- #
# 枚举 / 缓存 / 续跑（逐 IP，跳过 .0/.255）
# --------------------------------------------------------------------------- #
def iter_ips(cf_path):
    for net in common.load_nets(cf_path):
        if net.version != 4:
            continue
        for ip in net.hosts():
            yield str(ip)


def count_hosts(cf_path):
    total = 0
    for net in common.load_nets(cf_path):
        if net.version != 4:
            continue
        total += net.num_addresses - 2 if net.prefixlen <= 30 else net.num_addresses
    return total


def load_cache_ipset(path):
    done = set()
    if path and os.path.exists(path):
        with open(path, "r", encoding="utf-8") as fh:
            for ln in fh:
                ip = ln.split("\t", 1)[0].strip()
                if ip:
                    done.add(ip)
        sys.stderr.write(f"[OK] 断点缓存：已探 {len(done)} 个 IP -> {path}\n")
    return done


def fmt_eta(seconds):
    seconds = int(max(0, seconds))
    h, rem = divmod(seconds, 3600)
    m, s = divmod(rem, 60)
    return f"{h}h{m:02d}m" if h else f"{m}m{s:02d}s"


def probe_all(cf_path, host, timeout, concurrency, cache_path):
    done = load_cache_ipset(cache_path)
    total = count_hosts(cf_path)
    remaining = max(0, total - len(done))
    sys.stderr.write(f"[..] 逐 IP 探测：总可探 {total}，已探 {len(done)}，待探 ~{remaining}，并发 {concurrency}\n")

    todo = (ip for ip in iter_ips(cf_path) if ip not in done)
    os.makedirs(os.path.dirname(cache_path) or ".", exist_ok=True)
    cache_fh = open(cache_path, "a", encoding="utf-8")
    lock = threading.Lock()
    ex = ThreadPoolExecutor(max_workers=concurrency)
    t0 = time.time()
    cnt = hit = 0
    interrupted = False

    def work(ip):
        return ip, pop.probe_pop(ip, host, timeout)

    try:
        while True:
            chunk = list(itertools.islice(todo, CHUNK))
            if not chunk:
                break
            for fut in as_completed([ex.submit(work, ip) for ip in chunk]):
                ip, iata = fut.result()
                cnt += 1
                if iata:
                    hit += 1
                with lock:
                    cache_fh.write(f"{ip}\t{iata or '-'}\n")
                    if cnt % FLUSH_EVERY == 0:
                        cache_fh.flush()
                if cnt % PROGRESS_EVERY == 0:
                    rate = cnt / max(1e-6, time.time() - t0)
                    eta = (remaining - cnt) / max(1e-6, rate)
                    sys.stderr.write(f"[..] 进度 {cnt}/{remaining} 新探（命中 {hit}），"
                                     f"{rate:.0f} ip/s，ETA {fmt_eta(eta)}\n")
    except KeyboardInterrupt:
        interrupted = True
        sys.stderr.write("\n[中断] 收到 Ctrl-C，缓存已保存，下次带同一 --cache 可续跑。\n")
    finally:
        with lock:
            cache_fh.flush()
            cache_fh.close()
        ex.shutdown(wait=False, cancel_futures=True)

    sys.stderr.write(f"[OK] 本次新探 {cnt}（命中 {hit}）。\n")
    if interrupted:
        sys.exit(130)


# --------------------------------------------------------------------------- #
# 合并：流式读缓存 -> 严格如实归类（不做 /24 填充）-> 每国 collapse 到最大 CIDR
# --------------------------------------------------------------------------- #
def build_range_index(cf_path):
    nets = [n for n in common.load_nets(cf_path) if n.version == 4]
    ivs = sorted((int(n.network_address), int(n.broadcast_address))
                 for n in ipaddress.collapse_addresses(nets))
    starts = [s for s, _ in ivs]
    return starts, ivs


def in_ranges(ipint, starts, ivs):
    i = bisect.bisect_right(starts, ipint) - 1
    return 0 <= i < len(ivs) and ivs[i][0] <= ipint <= ivs[i][1]


def _iter_cache_all(cache_path):
    """yield (ipint, iata_or_None)：无响应行(iata=='-')也 yield（iata=None）。"""
    with open(cache_path, "r", encoding="utf-8") as fh:
        for ln in fh:
            ln = ln.rstrip("\n")
            if not ln or "\t" not in ln:
                continue
            ip, iata = ln.split("\t", 1)
            try:
                ipint = int(ipaddress.IPv4Address(ip.strip()))
            except ValueError:
                continue
            iata = iata.strip()
            yield ipint, (iata if iata and iata != "-" else None)


def ints_to_cidrs(ints):
    """把一堆 IPv4 整数「能合多大合多大」地压成最少 CIDR（连续区间 -> summarize，带洞自然断开）。"""
    out = []
    ints = sorted(set(ints))
    i, n = 0, len(ints)
    while i < n:
        j = i
        while j + 1 < n and ints[j + 1] == ints[j] + 1:
            j += 1
        out.extend(ipaddress.summarize_address_range(
            ipaddress.IPv4Address(ints[i]), ipaddress.IPv4Address(ints[j])))
        i = j + 1
    return out


def merge_from_cache(cf_path, cache_path, iata_db):
    starts, ivs = build_range_index(cf_path)
    resp_by_cc = {}          # cc -> [ipint]（仅实际应答；不含任何未探/无响应主机）
    no_resp = []             # [ipint] 探了但无响应
    unknown_ips = []         # [ipint] 探到 POP 但 IATA 未知
    unknown_iata = set()
    ccs_by24 = {}            # base24 -> set(cc)（仅应答且已知国，用于 .0/.255 桥接 + 对照统计）

    for ipint, iata in _iter_cache_all(cache_path):
        if not in_ranges(ipint, starts, ivs):
            continue
        if iata is None:
            no_resp.append(ipint)
            continue
        cc = iata_db.get(iata)
        if not cc:
            unknown_iata.add(iata)
            unknown_ips.append(ipint)
            continue
        resp_by_cc.setdefault(cc, []).append(ipint)
        ccs_by24.setdefault(ipint & 0xFFFFFF00, set()).add(cc)

    # .0/.255 桥接：仅对「应答 IP 全属同一国」的 /24（跨 POP 的 /24 不桥），纯为向上合并，不动无响应主机。
    bridged = 0
    for b, ccs in ccs_by24.items():
        if len(ccs) == 1:
            resp_by_cc[next(iter(ccs))].extend((b, b + 255))
            bridged += 1

    stats = dict(resp24=len(ccs_by24), bridged=bridged, no_resp=len(no_resp),
                 unknown=len(unknown_ips), unknown_iata=sorted(unknown_iata))
    return resp_by_cc, no_resp, unknown_ips, stats


# --------------------------------------------------------------------------- #
# 落盘 + 对照报告
# --------------------------------------------------------------------------- #
def write_and_report(out_dir, resp_by_cc, no_resp, unknown_ips, stats):
    os.makedirs(out_dir, exist_ok=True)
    grand_min = 33
    for cc, ints in sorted(resp_by_cc.items()):
        merged = common.write_nets(os.path.join(out_dir, f"{cc.lower()}.txt"), ints_to_cidrs(ints))
        v4 = [n for n in merged if n.version == 4]
        biggest = min((n.prefixlen for n in v4), default=32)
        grand_min = min(grand_min, biggest)
        big = sum(1 for n in v4 if n.prefixlen < 24)
        sys.stderr.write(f"[OK] {cc}: {len(merged)} 条（{big} 个 >/24 合并块，最大 /{biggest}）"
                         f"-> {out_dir}/{cc.lower()}.txt\n")
    if no_resp:
        m = common.write_nets(os.path.join(out_dir, "no_response.txt"), ints_to_cidrs(no_resp))
        sys.stderr.write(f"[OK] no_response: {len(m)} 条（{stats['no_resp']} 个无响应 IP）"
                         f"-> {out_dir}/no_response.txt\n")
    if unknown_ips:
        m = common.write_nets(os.path.join(out_dir, "unknown_iata.txt"), ints_to_cidrs(unknown_ips))
        sys.stderr.write(f"[OK] unknown_iata: {len(m)} 条 -> {out_dir}/unknown_iata.txt\n")
    sys.stderr.write(f"[STAT] 有应答 /24 {stats['resp24']}（桥接 .0/.255 的 {stats['bridged']}）；"
                     f"无响应 IP {stats['no_resp']}；未知IATA IP {stats['unknown']}\n")
    if stats["unknown_iata"]:
        sys.stderr.write(f"[WARN] 库/表都缺这些 IATA（落 unknown_iata.txt，可补 IATA2CC）: "
                         f"{', '.join(stats['unknown_iata'])}\n")
    return grand_min


def main():
    ap = argparse.ArgumentParser(
        description="逐 IP 如实抓取 CloudFront POP（不做 /24 假设）：按国家最大化合并 + 无响应单列。"
                    "纯全量抓取；对照快版用独立脚本 cft_pop_compare.py")
    ap.add_argument("--cloudfront-ip", required=True, help="要探的 CloudFront 段（建议用只含 GLOBAL 段的 cloudfront_global.txt）")
    ap.add_argument("--out-dir", required=True, help="输出目录（独立于快版，别互相覆盖）")
    ap.add_argument("--cache", required=True,
                    help="断点续跑缓存（必填）：不存在自动建；随时中断可续；合并也从它流式读")
    ap.add_argument("--host", default=pop.DEFAULT_HOST)
    ap.add_argument("--iata-db", default=None,
                    help="机场库 CSV 本地路径（由 sh 统一 wget 下载；拿不到直接报错退出，不退化）")
    ap.add_argument("--concurrency", type=int, default=256)
    ap.add_argument("--timeout", type=float, default=3.0)
    ap.add_argument("--merge-only", action="store_true", help="跳过探测，只用已有 --cache 重新合并落盘")
    args = ap.parse_args()

    iata_db = pop.build_iata_db(args.iata_db)

    if not args.merge_only:
        probe_all(args.cloudfront_ip, args.host, args.timeout, args.concurrency, args.cache)

    if not os.path.exists(args.cache):
        sys.stderr.write("[WARN] 无缓存可合并，exit 0\n")
        return 0

    resp_by_cc, no_resp, unknown_ips, stats = merge_from_cache(args.cloudfront_ip, args.cache, iata_db)
    if sum(len(v) for v in resp_by_cc.values()) == 0 and not no_resp:
        sys.stderr.write("[WARN] 缓存里没有任何本段内的记录（网络退化？），不落文件，exit 0\n")
        return 0

    grand_min = write_and_report(args.out_dir, resp_by_cc, no_resp, unknown_ips, stats)
    sys.stderr.write(f"[DONE] 逐 IP 如实版完成（{len(resp_by_cc)} 国 + no_response，最大合并块 /{grand_min} -> {args.out_dir}）。\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
