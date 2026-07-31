#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
gen_azure_region.py —— 把 Azure ServiceTags 里「带 region 的段」按 region→国家拆成每国一个文件。

和 azure_fd 的区别（别混）：
  - gen_cdn_sets.py 的 azure_fd = AzureFrontDoor / AzureCDN，是 Azure 的**全球 anycast 边缘/CDN**
    （就近入网，region 字段为空，不分地区），进 cdn_ip_all 当 CDN 处理。
  - 本脚本 = Azure 的**其余服务**（VM/存储/数据库… 云主机段）。ServiceTags 每条自带 region（如 eastasia），
    是**地理固定单播**，可按 region→国家权威拆分（类似 gen_aws_region，无需探测）。**刻意跳过 FrontDoor/CDN**。

规模（实测 2026-07）：77 个 region、约 4.5 万条前缀——很大。所以 mosdns_config_gen.sh 里默认**注释不开**，按需启用。

产出：<out-dir>/<cc>.txt（eastasia->hk、southeastasia->sg、japaneast->jp、taiwannorth->tw …）。
数据源：ServiceTags_Public JSON（gen_cdn_sets.discover_azure_url 自动发现，或 --azure-json/--azure-url 指定）。
退化：拉不到 -> 告警、exit 0、不落文件，不阻断打包。
"""
import argparse
import ipaddress
import json
import os
import sys

import cdn_common as common
import gen_cdn_sets as sets  # 复用 discover_azure_url

for _s in (sys.stdout, sys.stderr):
    try:
        _s.reconfigure(encoding="utf-8")
    except Exception:  # noqa: BLE001
        pass

# Azure ServiceTags 的 region 内部名 -> ISO2 国家。命名稳定；新区补一行即可，查不到的会告警并跳过。
AZURE_REGION2CC = {
    # 美国（含 canary=euap / staging）
    "centralus": "US", "centraluseuap": "US", "eastus": "US", "eastus2": "US", "eastus2euap": "US",
    "eastus3": "US", "northcentralus": "US", "northeastus5": "US", "southcentralus": "US",
    "southcentralus2": "US", "southeastus": "US", "southeastus3": "US", "southeastus5": "US",
    "southwestus": "US", "westcentralus": "US", "westus": "US", "westus2": "US", "westus3": "US",
    "usstagec": "US", "usstagee": "US",
    # 加拿大 / 墨西哥 / 南美
    "canadacentral": "CA", "canadaeast": "CA", "mexicocentral": "MX",
    "brazilsouth": "BR", "brazilse": "BR", "brazilne": "BR", "chilec": "CL",
    # 欧洲
    "northeurope": "IE", "northeurope2": "IE", "westeurope": "NL",
    "uksouth": "GB", "ukwest": "GB", "centralfrance": "FR", "southfrance": "FR",
    "germanyn": "DE", "germanywc": "DE", "switzerlandn": "CH", "switzerlandw": "CH",
    "norwaye": "NO", "norwayw": "NO", "swedencentral": "SE", "swedensouth": "SE",
    "denmarkeast": "DK", "polandcentral": "PL", "italynorth": "IT", "spaincentral": "ES",
    "austriaeast": "AT", "belgiumcentral": "BE",
    # 中东 / 非洲
    "uaecentral": "AE", "uaenorth": "AE", "qatarcentral": "QA",
    "israelcentral": "IL", "israelnorthwest": "IL",
    "southafricanorth": "ZA", "southafricawest": "ZA",
    # 东亚（eastasia = 香港；taiwannorth = 台湾）
    "eastasia": "HK", "taiwannorth": "TW", "taiwannorthwest": "TW",
    "japaneast": "JP", "japanwest": "JP", "koreacentral": "KR", "koreasouth": "KR",
    # 东南亚 / 南亚 / 大洋洲（southeastasia = 新加坡）
    "southeastasia": "SG", "malaysiasouth": "MY", "malaysiawest": "MY", "indonesiacentral": "ID",
    "centralindia": "IN", "southindia": "IN", "westindia": "IN", "indiasouthcentral": "IN",
    "jioindiacentral": "IN", "jioindiawest": "IN",
    "australiaeast": "AU", "australiasoutheast": "AU", "australiacentral": "AU", "australiacentral2": "AU",
    "newzealandnorth": "NZ",
}

# 全球 anycast 边缘/CDN，归 azure_fd（gen_cdn_sets），不在本脚本按地区拆。
SKIP_NAME_PREFIX = ("AzureFrontDoor", "AzureCDN")


def load_servicetags(src):
    """src 为本地路径 -> 读文件；为 URL -> 拉；为空 -> 自动发现下载。失败返回 None。"""
    try:
        if src and os.path.exists(src):
            with open(src, "r", encoding="utf-8") as fh:
                return json.load(fh)
        url = src or sets.discover_azure_url()
        if not url:
            sys.stderr.write("[WARN] 未发现 ServiceTags 下载链接\n")
            return None
        return json.loads(common.fetch(url).decode("utf-8", "ignore"))
    except Exception as exc:  # noqa: BLE001
        sys.stderr.write(f"[WARN] 读取 ServiceTags 失败，退化不落文件: {exc}\n")
        return None


def classify(obj):
    """返回 {cc: [net,...]}, unknown_regions。"""
    by_cc, unknown = {}, set()
    for val in obj.get("values", []):
        if val.get("name", "").startswith(SKIP_NAME_PREFIX):
            continue
        props = val.get("properties", {})
        region = (props.get("region") or "").strip()
        if not region:
            continue
        cc = AZURE_REGION2CC.get(region.lower())
        if not cc:
            unknown.add(region)
            continue
        for pfx in props.get("addressPrefixes", []):
            try:
                by_cc.setdefault(cc, []).append(ipaddress.ip_network(pfx, strict=False))
            except ValueError:
                sys.stderr.write(f"[WARN] 跳过非法前缀: {pfx}\n")
    return by_cc, unknown


def main():
    ap = argparse.ArgumentParser(
        description="把 Azure ServiceTags 里带 region 的段按 region→国家拆（跳过 AzureFrontDoor/CDN 那批 anycast）")
    ap.add_argument("--azure-json", default=None, help="ServiceTags JSON 本地路径（优先）")
    ap.add_argument("--azure-url", default=None, help="ServiceTags JSON URL（默认自动发现）")
    ap.add_argument("--out-dir", required=True, help="每国文件输出目录，如 .../mosdns_ip/azure_cc")
    args = ap.parse_args()

    obj = load_servicetags(args.azure_json or args.azure_url)
    if not obj:
        return 0  # 退化：不阻断打包

    by_cc, unknown = classify(obj)
    if unknown:
        sys.stderr.write(f"[WARN] 这些 Azure region 不在 AZURE_REGION2CC（已跳过，可补表）: {', '.join(sorted(unknown))}\n")
    if not by_cc:
        sys.stderr.write("[WARN] 没解析到任何可归类前缀，不落文件，exit 0\n")
        return 0

    os.makedirs(args.out_dir, exist_ok=True)
    total = 0
    for cc, nets in sorted(by_cc.items()):
        m = common.write_nets(os.path.join(args.out_dir, f"{cc.lower()}.txt"), nets)
        total += len(m)
        sys.stderr.write(f"[OK] {cc}: {len(m)} 条 -> {args.out_dir}/{cc.lower()}.txt\n")
    sys.stderr.write(f"[DONE] Azure 按国家拆分完成（{len(by_cc)} 国 / {total} 条 -> {args.out_dir}）。\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
