#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
gen_cloudfront_pop.py —— CloudFront「按真实 POP 国家分类」的**快版**（每 /24 探 1 个代表 IP）。

背景（为什么要这一步）：
  CloudFront 是「单播 + DNS 调度」CDN，每个边缘 POP 有各自 IP。geoip.dat 把大量 CloudFront 边缘段标错国家
  （典型：香港 POP 段 18.65.14.0/24 被标成 US）。CloudFront 每个 HTTP 响应头里带 `x-amz-cf-pop: HKG61-P1`
  （前 3 位 = IATA 机场码 = POP 城市），是权威信号。本脚本探每个 /24 的 POP -> IATA -> 国家。

快版策略：每个 /24 **探到一个有响应的代表 IP 为止**，就把整段 /24 归给该 POP（省时，每次打包都能跑）。
  想验证这个「/24 假设」有没有漏网，用逐 IP 全量版 gen_cloudfront_pop_full.py + 对照脚本 cft_pop_compare.py。

代表 IP 为什么要试多个（--max-probes-per-24）
--------------------------------------------
  只探 .1 一个的话，.1 恰好不应答就会把**整个 /24 丢掉**（既不落国家、也不落 no_response，白丢）。
  拿 full 版缓存实测（4,199,614 个 IP / 16,414 个 /24，其中 10,862 个 /24 至少有一个 IP 应答）：
      只探 .1               覆盖 10,567/10,862 = 97.28%  （295 个有响应的 /24 被漏掉）
  改成「按 .1 -> 二分展开（.1 .129 .65 .193 .33 .97 .161 .225 .17 …）依次试，一有响应就停」：
      试 3 个  98.61%      试 5 个  99.53%      试 8 个  99.59%      试 9 个  99.85%      试满 254 个  100%
  代价只落在**整段全无响应**的 /24 上（它们每段要白试满 K 次，其余 /24 基本第 1 次就命中）：实测 5,552 个
  死段 × K 次超时。默认 K=8（99.59%，性价比拐点）；--max-probes-per-24 0 = 试满整段（100% 但接近全量版耗时，
  按 concurrency 64 / timeout 5 估要几十小时，别在每次打包里开）。K 调大时记得同步调大 --concurrency。

分层（谁看都清楚，不再互相 import 可执行脚本）：
  - cdn_common      : load_nets / write_nets / …（通用 IP/IO）
  - cft_pop_common  : probe_pop / build_iata_db / IATA2CC（CloudFront POP 探测公共件）
  - 本脚本          : 只做快版特有的「枚举 /24 -> 并发探 -> 每国落文件」流程。

落盘（和 full 版同构，便于 cft_pop_compare.py 逐项对照）：
  <cc>.txt 每国；no_response.txt = 试满 K 个代表 IP 都没响应的整段 /24；unknown_iata.txt = 探到 POP 但
  IATA 查不到国家的段。后两个不塞进任何国家。

只处理 IPv4（/24 探测是 v4 概念；IPv6 段保持 geoip 原样）。
退化：拿不到机场库 CSV -> build_iata_db 直接报错退出(不退化)；一个 POP 都没探到 -> 告警、exit 0，不阻断打包。
"""
import argparse
import functools
import ipaddress
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
    返回 [ipaddress.IPv4Network, ...]，按单元去重（代表 IP 由 probe_unit 现算，可能要试好几个）。"""
    units = {}
    for net in common.load_nets(cf_path):
        if net.version != 4:
            continue
        pieces = net.subnets(new_prefix=24) if net.prefixlen <= 23 else [net]
        for u in pieces:
            units.setdefault(str(u), u)
    return list(units.values())


@functools.lru_cache(maxsize=None)
def spread_order(count):
    """0..count-1 的「二分展开」下标顺序：0, 中点, 四分点, 八分点 …

    比 0,1,2,3… 顺扫强得多：死的往往是**连续一片**，顺扫等于在同一片死区里反复撞。
    实测（见文件头）同样试 5 次，二分展开 99.53% vs 顺扫 98.43%。"""
    order, seen = [], set()
    stride = 1
    while stride < count:
        stride *= 2
    while stride >= 1:
        for i in range(0, count, stride):
            if i not in seen:
                seen.add(i)
                order.append(i)
        stride //= 2
    return order


def probe_candidates(net, limit):
    """按「先 .1，再二分展开」的顺序产出该单元里最多 limit 个可探主机（limit<=0 表示整段都试）。
    /31、/32 没有网络/广播地址概念，全部地址都可探。"""
    if net.num_addresses <= 2:
        first, count = int(net.network_address), net.num_addresses
    else:
        first, count = int(net.network_address) + 1, net.num_addresses - 2
    order = spread_order(count)
    if limit and limit > 0:
        order = order[:limit]
    for off in order:
        yield str(ipaddress.IPv4Address(first + off))


def probe_unit(net, host, timeout, max_probes):
    """在这个 /24 里一个个试代表 IP，**一有响应就停**；全都不应答才算 no_response。
    返回 (iata_or_None, 实际试了几个)。"""
    tried = 0
    for ip in probe_candidates(net, max_probes):
        tried += 1
        iata = pop.probe_pop(ip, host, timeout)
        if iata:
            return iata, tried
    return None, tried


def classify(units, host, timeout, concurrency, iata_db, max_probes):
    """并发探测。返回 {cc: [net,...]}, no_resp, unknown_nets, stats。"""
    by_cc = {}
    unknown_iata, unknown_nets, no_resp = [], [], []

    def work(net):
        iata, tried = probe_unit(net, host, timeout, max_probes)
        return net, iata, tried

    done = probes = retried = 0
    total = len(units)
    with ThreadPoolExecutor(max_workers=concurrency) as ex:
        futs = [ex.submit(work, u) for u in units]
        for fut in as_completed(futs):
            done += 1
            if done % 1000 == 0:
                sys.stderr.write(f"[..] 探测进度 {done}/{total}（累计发出 {probes} 次探测）\n")
            net, iata, tried = fut.result()
            probes += tried
            if tried > 1:
                retried += 1
            if not iata:
                no_resp.append(net)
                continue
            cc = iata_db.get(iata)
            if not cc:
                unknown_iata.append(iata)
                unknown_nets.append(net)
                continue
            by_cc.setdefault(cc, []).append(net)

    stats = dict(total=total, resolved=sum(len(v) for v in by_cc.values()),
                 no_resp=len(no_resp), unknown_iata=len(unknown_nets),
                 probes=probes, retried=retried)
    if unknown_iata:
        sys.stderr.write(f"[WARN] 库/表都缺这些 IATA（落 unknown_iata.txt，可补 cft_pop_common.IATA2CC）: "
                         f"{', '.join(sorted(set(unknown_iata)))}\n")
    return by_cc, no_resp, unknown_nets, stats


def write_per_country(out_dir, by_cc, no_resp, unknown_nets):
    """每国一个文件 + no_response.txt / unknown_iata.txt（和 full 版同构，方便 cft_pop_compare 对照）。"""
    os.makedirs(out_dir, exist_ok=True)
    for cc, nets in sorted(by_cc.items()):
        n = common.write_nets(os.path.join(out_dir, f"{cc.lower()}.txt"), nets)
        sys.stderr.write(f"[OK] {cc}: {len(n)} 条 -> {out_dir}/{cc.lower()}.txt\n")
    for name, nets in (("no_response", no_resp), ("unknown_iata", unknown_nets)):
        path = os.path.join(out_dir, f"{name}.txt")
        if nets:
            n = common.write_nets(path, nets)
            sys.stderr.write(f"[OK] {name}: {len(n)} 条（{len(nets)} 个 /24 单元）-> {path}\n")
        elif os.path.exists(path):
            os.remove(path)  # 这次一个都没有，别留上次的陈旧文件误导对照
            sys.stderr.write(f"[OK] {name}: 0 条，删掉旧的 {path}\n")


def main():
    ap = argparse.ArgumentParser(
        description="按 x-amz-cf-pop 把 CloudFront 段按真实 POP 国家分类，每国落一个文件"
                    "（快版：每 /24 试到有响应的代表 IP 为止，整段归给该 POP）")
    ap.add_argument("--cloudfront-ip", required=True, help="要分类的 CloudFront 段（建议用 ⓪ 拆出的 cloudfront_global.txt）")
    ap.add_argument("--out-dir", required=True, help="每国原始文件输出目录（如 .../mosdns_ip/cloudfront_pop）")
    ap.add_argument("--host", default=pop.DEFAULT_HOST, help="探测用的 *.cloudfront.net（SNI/Host）")
    ap.add_argument("--iata-db", default=None,
                    help="机场库 CSV 本地路径（由 sh 统一 wget 下载；拿不到直接报错退出，不退化）")
    ap.add_argument("--concurrency", type=int, default=64)
    ap.add_argument("--timeout", type=float, default=5.0)
    ap.add_argument("--max-probes-per-24", type=int, default=8,
                    help="每个 /24 最多试几个代表 IP（一有响应就停）；0 = 试满整段。"
                         "实测覆盖率 1个=97.3%% 5个=99.5%% 8个=99.6%%(默认) 满段=100%%，"
                         "代价全落在全死的 /24 上（每段白试满 K 次），调大请同步调大 --concurrency")
    args = ap.parse_args()

    units = enumerate_units(args.cloudfront_ip)
    if not units:
        sys.stderr.write("[WARN] cloudfront_ip 为空/不可读，跳过，exit 0\n")
        return 0

    iata_db = pop.build_iata_db(args.iata_db)
    cap = "整段" if args.max_probes_per_24 <= 0 else f"{args.max_probes_per_24} 个"
    sys.stderr.write(f"[..] 待探测 CloudFront /24 单元: {len(units)} 个，并发 {args.concurrency}，"
                     f"每段最多试 {cap}代表 IP（命中即停）\n")

    by_cc, no_resp, unknown_nets, stats = classify(
        units, args.host, args.timeout, args.concurrency, iata_db, args.max_probes_per_24)
    sys.stderr.write(
        "[STAT] 单元={total} 命中={resolved} 无响应={no_resp} 未知IATA={unknown_iata}；"
        "共发出 {probes} 次探测，其中 {retried} 个单元的首选代表 IP 没应答、换了备选\n".format(**stats))

    if stats["resolved"] == 0:
        sys.stderr.write("[WARN] 一个 POP 都没探到（网络退化？），不落文件，exit 0\n")
        return 0

    write_per_country(args.out_dir, by_cc, no_resp, unknown_nets)
    sys.stderr.write(f"[DONE] CloudFront 按国家分类完成（{len(by_cc)} 个国家 -> {args.out_dir}）。\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
