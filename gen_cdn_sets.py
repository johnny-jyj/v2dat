#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
gen_cdn_sets.py —— v2dat 侧「抽 CDN IP」助手（§6）。

职责（纯数据，不读 yaml、不认识 FA、不做区域分区）：拉源 / 合并 / CIDR 求差 / 落盘，产出 CDN 的 IP 全集。
通用 IP/IO/网络（load_nets / write_nets / fetch / subtract / collapse）统一用 cdn_common，本文件只放
GFE / Azure 的解析业务，不再自带一份重复的工具函数。

产物（默认写到 mosdns_config/mosdns_ip/）：
  - gfe_ip.txt      = goog.json − cloud.json（Google 前端/服务，剔除 GCP 客户段）
  - azure_fd_ip.txt = ServiceTags 里 AzureFrontDoor.* / AzureCDN 子集（Azure 的**边缘/CDN**，不是整个 Azure 云）
  - cdn_ip_all.txt  = (--cdn 各文件) ∪ gfe ∪ azure_fd（只收纯边缘 CDN，不整段并混云主机 AS）

退出码：网络拉取失败 -> 告警并写空文件继续（gfe/azure 退化，但不阻断打包）。
"""
import argparse
import ipaddress
import json
import re
import sys

import cdn_common as common

for _stream in (sys.stdout, sys.stderr):
    try:
        _stream.reconfigure(encoding="utf-8")
    except Exception:  # noqa: BLE001 - 老 Python/重定向场景忽略
        pass

GOOG_URL = "https://www.gstatic.com/ipranges/goog.json"
CLOUD_URL = "https://www.gstatic.com/ipranges/cloud.json"
AZURE_PAGE = "https://www.microsoft.com/en-us/download/confirmation.aspx?id=56519"


# --------------------------------------------------------------------------- #
# 数据源解析（业务，非通用工具）
# --------------------------------------------------------------------------- #
def parse_google(data):
    obj = json.loads(data)
    nets = []
    for pfx in obj.get("prefixes", []):
        cidr = pfx.get("ipv4Prefix") or pfx.get("ipv6Prefix")
        if cidr:
            nets.append(ipaddress.ip_network(cidr, strict=False))
    return nets


def discover_azure_url():
    html = common.fetch(AZURE_PAGE).decode("utf-8", "ignore")
    found = re.findall(
        r"https://download\.microsoft\.com/download/[^\"']*ServiceTags_Public_\d+\.json",
        html,
    )
    return found[0] if found else None


def parse_azure_front_door(data):
    obj = json.loads(data)
    nets = []
    for val in obj.get("values", []):
        name = val.get("name", "")
        if name.startswith("AzureFrontDoor") or name.startswith("AzureCDN"):
            for pfx in val.get("properties", {}).get("addressPrefixes", []):
                nets.append(ipaddress.ip_network(pfx, strict=False))
    return nets


def build_gfe():
    """gfe_ip = goog − cloud（剔除 GCP 客户段，只留真正的 Google 前端/服务）。"""
    try:
        goog = parse_google(common.fetch(GOOG_URL))
        cloud = parse_google(common.fetch(CLOUD_URL))
    except Exception as exc:  # noqa: BLE001
        sys.stderr.write(f"[WARN] GFE 计算失败（goog/cloud 拉取异常），gfe_ip 置空: {exc}\n")
        return []
    gfe = common.subtract(goog, cloud)
    sys.stderr.write(f"[OK] gfe = goog({len(goog)}) − cloud({len(cloud)}) = {len(gfe)} 条\n")
    return gfe


def build_azure_front_door():
    try:
        url = discover_azure_url()
        if not url:
            sys.stderr.write("[WARN] 未发现 ServiceTags 下载链接，azure_fd 置空\n")
            return []
        return parse_azure_front_door(common.fetch(url))
    except Exception as exc:  # noqa: BLE001
        sys.stderr.write(f"[WARN] Azure ServiceTags 拉取/解析失败，azure_fd 置空: {exc}\n")
        return []


def _write(path, nets):
    """落盘 + 打日志（cdn_common.write_nets 本身不打日志）。"""
    m = common.write_nets(path, nets)
    sys.stderr.write(f"[OK] 写出 {len(m)} 条 -> {path}\n")
    return m


# --------------------------------------------------------------------------- #
# main
# --------------------------------------------------------------------------- #
def main():
    ap = argparse.ArgumentParser(description="生成 cdn_ip_all / gfe_ip / azure_fd_ip（纯数据，抽 CDN IP）")
    ap.add_argument("--cdn", nargs="+", default=[], help="纯边缘 CDN 的 *_ip.txt（cloudflare/cloudfront/fastly/akamai/...）")
    ap.add_argument("--gfe-from-google", action="store_true", help="gfe_ip = goog.json − cloud.json")
    ap.add_argument("--azure-front-door", action="store_true", help="azure_fd_ip = ServiceTags AzureFrontDoor/AzureCDN")
    ap.add_argument("--azure-url", default=None, help="手动指定 ServiceTags JSON URL（默认自动发现）")
    ap.add_argument("--out-cdn-all", default=None)
    ap.add_argument("--out-gfe", default=None)
    ap.add_argument("--out-azure", default=None)
    args = ap.parse_args()

    # ---- 1. CDN 全集来源 ----
    cdn_nets = []
    for path in args.cdn:
        cdn_nets += common.load_nets(path)

    gfe = build_gfe() if args.gfe_from_google else []
    if args.out_gfe is not None:
        _write(args.out_gfe, gfe)

    if args.azure_url and args.azure_front_door:
        try:
            azure = parse_azure_front_door(common.fetch(args.azure_url))
        except Exception as exc:  # noqa: BLE001
            sys.stderr.write(f"[WARN] 指定 azure-url 拉取失败，azure_fd 置空: {exc}\n")
            azure = []
    elif args.azure_front_door:
        azure = build_azure_front_door()
    else:
        azure = []
    if args.out_azure is not None:
        _write(args.out_azure, azure)

    # ---- 2. cdn_ip_all = cdn ∪ gfe ∪ azure ----
    cdn_all = common.collapse_per_version(cdn_nets + gfe + azure)
    if args.out_cdn_all is not None:
        _write(args.out_cdn_all, cdn_all)

    sys.stderr.write("[DONE] gen_cdn_sets 完成（gfe/azure 若为空仅为网络退化，不阻断打包）。\n")
    sys.exit(0)


if __name__ == "__main__":
    main()
