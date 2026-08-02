#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
cft_pop_compare.py —— 独立对照「快版(/24 假设) vs full 版(逐 IP 如实)」的 CloudFront POP 分类，
专门用来查快版 /24 假设的漏网/误判。与快版、full 版都解耦：**只读它们的产物 + full 的逐 IP 缓存，
自己不做任何探测**。（full 版只管全量抓取，对照全在这里，两者互不搞混。）

输入
----
  --quick-dir   快版输出目录 cloudfront_pop/          （每国 <cc>.txt [+ no_response.txt / unknown_iata.txt]）
  --full-dir    full 版输出目录 cloudfront_pop_full/   （每国 <cc>.txt + no_response.txt + unknown_iata.txt）
  --full-cache  full 的逐 IP 缓存 cf_pop_full_cache.tsv（可选；ip<TAB>IATA。有它才能逐 /24 判「跨 POP」）
  --iata-db     机场库 CSV 本地路径（由 sh 统一 wget；配合 --full-cache 把 IATA->国家）

报告
----
  1) 每国 IP 数对照（换算成地址数，与 CIDR 粒度无关）：quick 总 / full 总 / 交集 / 仅quick / 仅full。
     **「仅quick」不是一坨黑箱**，按 full 的如实结论把它拆成 4 类（互斥，优先级 X > nr > uk > ?）：
       X  = full 把这些地址判给了**别的国家** -> 跨 POP /24 被快版整段误并，**这才是真误判**
       nr = full 探过但**无响应**（在 full 的 no_response.txt 里）-> 快版按 /24 假设整段填充，属预期行为，不是误判
       uk = full 探到 POP 但 IATA 查不到国家（full 的 unknown_iata.txt）-> 也不算快版错
       ?  = full 完全没覆盖（没探到/不在 full 输入范围）-> 无法判定
     「仅full」同样拆：nrq = 快版自己整段无响应（快版 no_response.txt，代表 IP 没应答但 full 探到了）+ 其它。
     最后给一句总结论：快版的多算里到底有多少是真误判。
  2) 「跨 POP 的 /24」= 快版会整段误判的漏网点，**两条独立路径各算一遍再互相印证**：
       [A] 逐 IP 缓存 --full-cache（原始信号，最细）
       [B] full 输出目录里的每国 <cc>.txt（落盘产物，检验 full 自己的合并/桥接有没有把结论改掉）
     两者应当完全一致；不一致就说明 full 的落盘环节有问题（或缓存/产物不是同一批），会单列出来。
     两边都为 0 才能下「快版『一个 /24 = 一个 POP』假设全对」的结论。
只读、可离线（除非要现拉机场库）。
"""

import argparse
import ipaddress
import itertools
import os
import sys

import cdn_common as common       # 复用 load_nets
import cft_pop_common as pop       # 复用 build_iata_db

for _s in (sys.stdout, sys.stderr):
    try:
        _s.reconfigure(encoding="utf-8")
    except Exception:  # noqa: BLE001
        pass

NON_COUNTRY_FILES = ("no_response", "unknown_iata")
SHOW_MAX = 100  # 跨 POP /24 最多逐条列这么多


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


def union(*ivs):
    """并集（输入都是区间列表，不要求已排序/互斥）。"""
    merged = []
    for s, e in sorted(itertools.chain(*ivs)):
        if merged and s <= merged[-1][1] + 1:
            merged[-1][1] = max(merged[-1][1], e)
        else:
            merged.append([s, e])
    return [(s, e) for s, e in merged]


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


def intersect(a, b):
    """a ∩ b；a、b 均为按起点排序、互不重叠的区间列表。"""
    res, i, j = [], 0, 0
    while i < len(a) and j < len(b):
        s, e = max(a[i][0], b[j][0]), min(a[i][1], b[j][1])
        if s <= e:
            res.append((s, e))
        if a[i][1] < b[j][1]:
            i += 1
        else:
            j += 1
    return res


def iter_24(iv):
    """区间列表 -> 覆盖到的所有 /24 基址（去重前，按序 yield）。"""
    for s, e in iv:
        for b in range(s & 0xFFFFFF00, e + 1, 256):
            yield b


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
        if cc in NON_COUNTRY_FILES:
            continue
        out[cc] = to_intervals(common.load_nets(os.path.join(d, fn)))
    return out


def load_side_file(d, name):
    """读目录里的 no_response.txt / unknown_iata.txt（没有就当空，不报错）。"""
    path = os.path.join(d, f"{name}.txt")
    if not os.path.exists(path):
        return [], False
    return to_intervals(common.load_nets(path)), True


def find_mixed_24_from_cache(cache_path, iata_db):
    """[A] 逐 IP 缓存：逐 /24 统计**应答**国家集合，返回 {base24_int: {cc,...}}（仅 len>1，即跨 POP）。"""
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
            by24.setdefault(p & 0xFFFFFF00, set()).add(cc.lower())
    return {b: ccs for b, ccs in by24.items() if len(ccs) > 1}


def find_mixed_24_from_dir(country_ivs):
    """[B] full 输出产物：逐 /24 统计**落盘时被判给了几个国家**，返回 {base24_int: {cc,...}}（仅 len>1）。

    full 版落盘时每个应答 IP 只会进一个国家文件，.0/.255 也只在「该 /24 内应答 IP 全属同一国」时才桥接，
    所以一个 /24 同时出现在两国文件里 <=> 它真的跨 POP。用它复算一遍，就能验证 [A] 的结论在
    「合并成大 CIDR + 桥接 .0/.255」之后有没有被改掉。"""
    by24 = {}
    for cc, iv in country_ivs.items():
        for b in iter_24(iv):
            by24.setdefault(b, set()).add(cc.lower())
    return {b: ccs for b, ccs in by24.items() if len(ccs) > 1}


# --------------------------------------------------------------------------- #
# 每国对照：把「仅快版」按 full 的如实结论拆开
# --------------------------------------------------------------------------- #
def diff_countries(quick, full, full_nores, full_unk, quick_nores):
    """返回 [row, ...]，row = dict(cc, tq, tf, inter, oq, of, mis, nr, uk, rest, of_nrq, of_rest, mis_to)。

    「仅快版」oq 拆成互斥的 4 份，优先级 mis > nr > uk > rest：
      mis  = full 判给别国（真误判；full 的 .0/.255 桥接可能同时出现在 no_response 里，所以误判优先算）
      nr   = full 探过无响应（快版 /24 整段填充，预期行为）
      uk   = full 探到 POP 但 IATA 未知
      rest = full 根本没覆盖
    「仅full」of 拆成 of_nrq（快版自己整段无响应：代表 IP 没应答，但 full 探到了）+ of_rest。"""
    full_all = union(*full.values()) if full else []
    rows = []
    for cc in sorted(set(quick) | set(full)):
        q, f = quick.get(cc, []), full.get(cc, [])
        oq_iv, of_iv = subtract(q, f), subtract(f, q)

        mis_iv = intersect(oq_iv, full_all)          # oq 已排除本国 -> 交到 full_all 即「判给别国」
        left = subtract(oq_iv, mis_iv)
        nr_iv = intersect(left, full_nores)
        left = subtract(left, nr_iv)
        uk_iv = intersect(left, full_unk)
        rest_iv = subtract(left, uk_iv)

        nrq_iv = intersect(of_iv, quick_nores)

        mis_to = []
        if mis_iv:
            for other, oiv in full.items():
                if other == cc:
                    continue
                n = total(intersect(mis_iv, oiv))
                if n:
                    mis_to.append((n, other))
            mis_to.sort(reverse=True)

        rows.append(dict(cc=cc, tq=total(q), tf=total(f), inter=total(q) - total(oq_iv),
                         oq=total(oq_iv), of=total(of_iv),
                         mis=total(mis_iv), nr=total(nr_iv), uk=total(uk_iv), rest=total(rest_iv),
                         of_nrq=total(nrq_iv), of_rest=total(of_iv) - total(nrq_iv),
                         mis_to=mis_to))
    return rows


def report_countries(rows, has_nores, has_unk, has_qnores):
    print("== 每国 IP 数对照（地址数）：q=快版 f=full ∩=交集 q\\f=仅快版 f\\q=仅full ==")
    print("   q\\f 再拆(互斥)：X=full判给别国(真误判) nr=full探过无响应(快版整段填充,预期) "
          "uk=full未知IATA ?=full未覆盖")
    if not has_nores:
        print("   [WARN] full 目录里没有 no_response.txt —— nr 一律算 0，会把无响应填充误记成 ?")
    if not has_unk:
        print("   [note] full 目录里没有 unknown_iata.txt（该 full 跑没有未知 IATA 就正常）")
    if has_qnores:
        print("   f\\q 再拆：nrq=快版自己整段无响应(代表IP没应答, full 探到了)")

    for r in rows:
        parts = f"X={r['mis']:,} nr={r['nr']:,} uk={r['uk']:,} ?={r['rest']:,}" if r["oq"] else "-"
        flag = ""
        if r["mis"]:
            top = "/".join(f"{cc}:{n:,}" for n, cc in r["mis_to"][:3])
            flag = f"  <-- 真误判 {r['mis']:,} 个地址，full 判给 {top}"
        elif r["oq"] and r["rest"] == r["oq"]:
            flag = "  <-- 全是 full 未覆盖，无法判定"
        elif r["oq"] and r["rest"]:
            flag = f"  <-- 多算的是无响应/未知IATA 填充（另有 {r['rest']:,} 个 full 未覆盖），非误判"
        elif r["oq"]:
            flag = "  <-- 多算的全是无响应/未知IATA 填充，非误判"
        print(f"  {r['cc']:4s} q={r['tq']:>10,} f={r['tf']:>10,} ∩={r['inter']:>10,} "
              f"q\\f={r['oq']:>9,} f\\q={r['of']:>9,} [{parts}]{flag}")

    agg = {k: sum(r[k] for r in rows) for k in ("oq", "of", "mis", "nr", "uk", "rest", "of_nrq", "of_rest")}
    oq = agg["oq"] or 1
    print("\n== 结论：快版比 full 多算的地址到底是什么 ==")
    print(f"  仅快版合计 {agg['oq']:,} 个地址：")
    print(f"    · X  真误判(full 判给别国) : {agg['mis']:>10,}  ({agg['mis'] / oq * 100:5.2f}%)  <-- 只有这项是 /24 假设的错")
    print(f"    · nr full 探过无响应        : {agg['nr']:>10,}  ({agg['nr'] / oq * 100:5.2f}%)  快版按 /24 整段填充，预期行为")
    print(f"    · uk full 未知 IATA         : {agg['uk']:>10,}  ({agg['uk'] / oq * 100:5.2f}%)")
    print(f"    · ?  full 未覆盖            : {agg['rest']:>10,}  ({agg['rest'] / oq * 100:5.2f}%)")
    if agg["mis"] == 0 and agg["oq"]:
        print("  ✓ 快版多算的部分里**没有一个地址**被 full 判给别国 —— 多算全来自无响应/未知IATA 填充，"
              "「一个 /24 = 一个 POP」在国家粒度上没造成误判。")
    elif agg["mis"]:
        print(f"  ✗ 有 {agg['mis']:,} 个地址被快版归错国家（跨 POP /24 整段误并），见上面带 X 的行。")
    if has_qnores:
        print(f"  仅 full 合计 {agg['of']:,} 个地址：其中快版整段无响应(代表 IP 都没应答) {agg['of_nrq']:,}，"
              f"其它 {agg['of_rest']:,}。")
        if agg["of_nrq"]:
            print("    -> 这部分是快版「代表 IP 恰好不应答就丢掉整个 /24」造成的漏收，"
                  "调大 gen_cloudfront_pop.py 的 --max-probes-per-24 可以捡回来。")
    else:
        print(f"  仅 full 合计 {agg['of']:,} 个地址：快版目录里没有 no_response.txt，拆不出「快版整段无响应」那部分"
              "（新版 gen_cloudfront_pop.py 会写这个文件）。")


# --------------------------------------------------------------------------- #
# 跨 POP /24：两条路径各算一遍 + 互相印证
# --------------------------------------------------------------------------- #
def report_mixed(mixed_a, mixed_b, have_a, have_b):
    print("\n== 跨 POP 的 /24（快版会整段误判的漏网点）：两条独立路径各算一遍 ==")
    if have_a:
        print(f"  [A] 逐 IP 缓存 --full-cache      : {len(mixed_a)} 个")
    else:
        print("  [A] 逐 IP 缓存 --full-cache      : 跳过（未给 --full-cache 或文件不存在）")
    if have_b:
        print(f"  [B] full 输出目录 <cc>.txt 复算  : {len(mixed_b)} 个")
    else:
        print("  [B] full 输出目录 <cc>.txt 复算  : 跳过（--full-dir 里没有任何国家文件）")

    ref = mixed_a if have_a else mixed_b
    if not (have_a or have_b):
        print("  （两条路径都没数据，无法判定）")
        return
    for b in sorted(ref)[:SHOW_MAX]:
        src = []
        if have_a and b in mixed_a:
            src.append("A:" + ",".join(sorted(mixed_a[b])))
        if have_b and b in mixed_b:
            src.append("B:" + ",".join(sorted(mixed_b[b])))
        print(f"    {ipaddress.IPv4Address(b)}/24 -> {'  '.join(src)}")
    if len(ref) > SHOW_MAX:
        print(f"    ...（还有 {len(ref) - SHOW_MAX} 个）")

    if have_a and have_b:
        only_a = sorted(set(mixed_a) - set(mixed_b))
        only_b = sorted(set(mixed_b) - set(mixed_a))
        both = sorted(set(mixed_a) & set(mixed_b))
        disagree = [b for b in both if mixed_a[b] != mixed_b[b]]
        print(f"  [A vs B] 交集 {len(both)}，仅A {len(only_a)}，仅B {len(only_b)}，"
              f"国家集合不一致 {len(disagree)}")
        for b in (only_a + only_b + disagree)[:20]:
            a_s = ",".join(sorted(mixed_a.get(b, []))) or "-"
            b_s = ",".join(sorted(mixed_b.get(b, []))) or "-"
            print(f"    ! {ipaddress.IPv4Address(b)}/24  A={a_s}  B={b_s}")
        if not (only_a or only_b or disagree):
            print("  ✓ 两条路径结论完全一致 —— full 的『合并成大 CIDR + 桥接 .0/.255』没有改变跨 POP 判定。")
        else:
            print("  ✗ 两条路径不一致 —— 缓存和产物不是同一批，或 full 的合并/桥接环节有问题，按上面逐条查。")

    if not ref:
        print("  ✓ 没有跨 POP 的 /24 —— 快版『一个 /24 = 一个 POP』假设全对，无漏网。")


def main():
    ap = argparse.ArgumentParser(description="对照 快版 vs full 版 CloudFront POP 分类，查 /24 假设漏网/误判")
    ap.add_argument("--quick-dir", required=True, help="快版目录 cloudfront_pop/")
    ap.add_argument("--full-dir", required=True, help="full 版目录 cloudfront_pop_full/")
    ap.add_argument("--full-cache", default=None, help="full 的逐 IP 缓存（有它才做路径 [A] 的『跨 POP /24』检测）")
    ap.add_argument("--iata-db", default=None,
                    help="机场库 CSV 本地路径（由 sh 统一 wget；配合 --full-cache 把 IATA->国家）")
    args = ap.parse_args()

    quick = load_country_intervals(args.quick_dir)
    full = load_country_intervals(args.full_dir)
    full_nores, has_nores = load_side_file(args.full_dir, "no_response")
    full_unk, has_unk = load_side_file(args.full_dir, "unknown_iata")
    quick_nores, has_qnores = load_side_file(args.quick_dir, "no_response")

    rows = diff_countries(quick, full, full_nores, full_unk, quick_nores)
    report_countries(rows, has_nores, has_unk, has_qnores)

    have_a = bool(args.full_cache and os.path.exists(args.full_cache))
    mixed_a = find_mixed_24_from_cache(args.full_cache, pop.build_iata_db(args.iata_db)) if have_a else {}
    mixed_b = find_mixed_24_from_dir(full)
    report_mixed(mixed_a, mixed_b, have_a, bool(full))
    if not have_a:
        print("  （未给 --full-cache，路径 [A] 跳过；两条路径都跑才能互相印证）")
    return 0


if __name__ == "__main__":
    sys.exit(main())
