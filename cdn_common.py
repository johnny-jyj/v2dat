#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
cdn_common.py —— v2dat 侧「抽 CDN / 云厂商 IP」这批脚本的**公共底层**（纯 IP / IO / 网络，无业务）。

为什么有它：以前是各脚本互相 `import gen_cloudfront_pop as base` 去蹭它的 load_nets/write_nets/fetch，
  一个 AWS 脚本要 import 一个 CloudFront 脚本才能用工具函数，谁都看不懂。现在通用件全收拢到这里，
  谁需要就 `import cdn_common`，一处改、处处生效。

在用的：gen_cloudfront_pop / gen_cloudfront_pop_full / cft_pop_compare / gen_aws_region /
        gen_cloudfront_split / gen_cdn_sets。

只放「谁都可能用」的通用件：
  - load_nets / collapse_per_version / write_nets : 读 / 按版本合并 / 排序落盘 CIDR
  - fetch                                         : 带重试的 HTTP GET（返回 bytes）
  - subtract                                      : CIDR 集合求差 union(a) - union(b)
CloudFront POP 探测那套（probe_pop / IATA2CC / build_iata_db）是业务，放 cft_pop_common.py。
"""
import ipaddress
import os
import sys
import time
import urllib.request


def load_nets(path):
    nets = []
    try:
        with open(path, "r", encoding="utf-8") as fh:
            for ln in fh:
                ln = ln.strip()
                if not ln or ln.startswith("#"):
                    continue
                try:
                    nets.append(ipaddress.ip_network(ln, strict=False))
                except ValueError:
                    sys.stderr.write(f"[WARN] {path}: 跳过非法 CIDR/IP: {ln}\n")
    except FileNotFoundError:
        sys.stderr.write(f"[WARN] 输入文件不存在，按空处理: {path}\n")
    return nets


def collapse_per_version(nets):
    """v4、v6 分别 collapse（跨版本不能混合）。"""
    out = []
    for ver in (4, 6):
        same = [n for n in nets if n.version == ver]
        if same:
            out.extend(ipaddress.collapse_addresses(same))
    return out


def write_nets(path, nets):
    """collapse + 排序后落盘；返回落盘后的 nets（纯函数，不打日志，日志由调用方按需打）。"""
    nets = collapse_per_version(nets)
    nets.sort(key=lambda n: (n.version, int(n.network_address), n.prefixlen))
    os.makedirs(os.path.dirname(path) or ".", exist_ok=True)
    with open(path, "w", encoding="utf-8") as fh:
        for n in nets:
            fh.write(f"{n}\n")
    return nets


def fetch(url, timeout=30, retries=3):
    last = None
    for attempt in range(1, retries + 1):
        try:
            req = urllib.request.Request(url, headers={"User-Agent": "mosdns-gen/1.0"})
            with urllib.request.urlopen(req, timeout=timeout) as resp:
                return resp.read()
        except Exception as exc:  # noqa: BLE001 - 网络任何异常都重试
            last = exc
            sys.stderr.write(f"[WARN] 拉取失败({attempt}/{retries}) {url}: {exc}\n")
            time.sleep(2)
    raise last


def subtract(a_nets, b_nets):
    """union(a) - union(b)，按版本分别处理（CIDR 要么包含要么不相交，不会半重叠）。"""
    out = []
    for ver in (4, 6):
        a = list(ipaddress.collapse_addresses([n for n in a_nets if n.version == ver]))
        b = list(ipaddress.collapse_addresses([n for n in b_nets if n.version == ver]))
        remaining = a
        for bn in b:
            nxt = []
            for r in remaining:
                if not r.overlaps(bn):
                    nxt.append(r)
                elif bn.prefixlen <= r.prefixlen:
                    # bn 覆盖 r => r 整条删去
                    continue
                else:
                    # r 包含 bn => 从 r 里挖掉 bn
                    nxt.extend(r.address_exclude(bn))
            remaining = nxt
        out.extend(remaining)
    return out
