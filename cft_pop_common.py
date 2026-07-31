#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
cft_pop_common.py —— CloudFront（缩写 **CFT**）POP 探测这套脚本的**公共业务件**。

命名约定：本项目里 cft_ / cloudfront 一律指 **CloudFront**；Cloudflare 一律写全称 cloudflare，别用 cf 混淆。

为什么有它：快版 gen_cloudfront_pop、全量版 gen_cloudfront_pop_full、对照 cft_pop_compare 三者都要
  「连 IP 取 x-amz-cf-pop」「IATA->国家」这套，以前是 full/compare 去 import 快版蹭，现在收拢到这里，
  三者平级各自 `import cft_pop_common`，一处改处处生效。

放这里的都是「CloudFront POP 专属」：
  - probe_pop      : 连某 IP（SNI/Host=分发域名）取响应头 x-amz-cf-pop 的 3 位 IATA
  - IATA2CC        : IATA 机场码 -> ISO2 国家 的**内置兜底表**
  - build_iata_db  : 读本地机场库 CSV（由 mosdns_config_gen.sh 统一 wget）为主 + IATA2CC 补缺
底层 IP/IO/网络（load_nets / write_nets / fetch / …）在 cdn_common.py，本模块不重复。

IATA2CC 与机场库的关系（正确性第一）：
  机场库 CSV 为主（datahub/ourairports，9000+ 码），由 sh 统一 wget 到本地；**拿不到 CSV 直接报错退出、绝不
  静默退化**（build_iata_db 里 raise SystemExit）。本表 IATA2CC 是「基础兜底」：CSV 读到后只补 CSV 缺的 IATA
  （setdefault，不覆盖）。实测机场库覆盖本表 126/132、零冲突，缺的 6 个是都会区/停用码（见 IATA2CC 上方注释）。
"""
import csv
import os
import re
import socket
import ssl
import sys

# 任意一个「长期在线、Price Class All」的分发都行；边缘对任何分发都返回 x-amz-cf-pop。
DEFAULT_HOST = "d21usjoq99fcb9.cloudfront.net"  # download.pytorch.org 背后的分发

POP_RE = re.compile(rb"(?im)^x-amz-cf-pop:\s*([A-Za-z]{3})")

# IATA 机场码 -> ISO2 国家的「基础兜底表」。机场库 CSV 是主力（build_iata_db 里 CSV 为主、本表 setdefault 补缺）；
# 本表保证这些常见 POP 城市**永远有**，也是「万一 airport-codes.csv 源哪天消失、改代码时的兜底锚点」——所以完整保留。
#
# 实测（airport-codes.csv vs 本表，见 test/check_iata_coverage.py）：本表 132 条，CSV 覆盖其中 126、零冲突；
# CSV 查不到的 6 个是都会区/停用码，靠本表兜：
#   YTO(多伦多都会区) LON(伦敦都会区) TXL(柏林 Tegel，2020 已关) TYO(东京都会区) SEL(首尔都会区) JKT(雅加达都会区)
# —— ourairports 只收具体机场，不含 metro-area/已关闭码；而 CloudFront POP 基本用具体机场码(NRT/HND/ICN/LHR…)。
#
# 在 airport-codes.csv 里怎么查某个 IATA（列序：ident,type,name,elevation_ft,continent,iso_country,iso_region,
#   municipality,gps_code,iata_code,local_code,coordinates）：搜第 10 列 iata_code == 该码，取同行第 6 列 iso_country。
#   例：HKG 那行 ident=VHHH(ICAO)、iata_code=HKG、iso_country=HK（第一列是 ICAO，所以直接搜 HKG 会先撞到杂项）。
IATA2CC = {
    # 美国 US
    "IAD": "US", "DCA": "US", "BOS": "US", "JFK": "US", "EWR": "US", "LGA": "US",
    "ATL": "US", "MIA": "US", "ORD": "US", "MDW": "US", "DFW": "US", "DAL": "US",
    "IAH": "US", "DEN": "US", "LAS": "US", "LAX": "US", "SFO": "US", "SJC": "US",
    "SEA": "US", "PDX": "US", "PHX": "US", "SLC": "US", "MSP": "US", "DTW": "US",
    "PHL": "US", "TPA": "US", "CMH": "US", "BNA": "US", "MCI": "US", "PIT": "US",
    "IND": "US", "CLT": "US", "JAX": "US", "RIC": "US", "HIO": "US", "STL": "US",
    "MEM": "US", "OKC": "US", "ABQ": "US", "BUF": "US", "ORF": "US", "SAN": "US",
    # 加拿大 CA
    "YYZ": "CA", "YTO": "CA", "YUL": "CA", "YVR": "CA",
    # 墨西哥 / 中南美
    "QRO": "MX", "MEX": "MX", "GRU": "BR", "GIG": "BR", "FOR": "BR", "POA": "BR",
    "EZE": "AR", "SCL": "CL", "BOG": "CO", "LIM": "PE",
    # 欧洲 EU
    "LHR": "GB", "LON": "GB", "MAN": "GB", "DUB": "IE", "CDG": "FR", "MRS": "FR",
    "FRA": "DE", "DUS": "DE", "MUC": "DE", "TXL": "DE", "HAM": "DE", "STR": "DE",
    "BER": "DE", "AMS": "NL", "MXP": "IT", "FCO": "IT", "PMO": "IT", "MAD": "ES",
    "BCN": "ES", "LIS": "PT", "ARN": "SE", "HEL": "FI", "CPH": "DK", "OSL": "NO",
    "WAW": "PL", "VIE": "AT", "ZRH": "CH", "GVA": "CH", "BRU": "BE", "PRG": "CZ",
    "ATH": "GR", "SKG": "GR", "BUD": "HU", "SOF": "BG", "OTP": "RO",
    # 非洲
    "CPT": "ZA", "JNB": "ZA", "NBO": "KE", "LOS": "NG", "CAI": "EG",
    # 东亚
    "HKG": "HK", "TPE": "TW",
    "NRT": "JP", "KIX": "JP", "TYO": "JP", "ITM": "JP",
    "ICN": "KR", "SEL": "KR", "GMP": "KR",
    # 东南亚 / 南亚
    "SIN": "SG", "KUL": "MY", "JHB": "MY", "BKK": "TH", "CGK": "ID", "JKT": "ID",
    "MNL": "PH", "HAN": "VN", "SGN": "VN",
    "BOM": "IN", "DEL": "IN", "MAA": "IN", "HYD": "IN", "BLR": "IN", "CCU": "IN",
    "PNQ": "IN", "NAG": "IN", "IXC": "IN",
    # 大洋洲
    "SYD": "AU", "MEL": "AU", "PER": "AU", "BNE": "AU", "AKL": "NZ",
    # 中东
    "DXB": "AE", "FJR": "AE", "TLV": "IL", "BAH": "BH",
}


def build_iata_db(local_file):
    """返回 {IATA: cc}：本地机场库 CSV 为主 + 内置 IATA2CC 补 CSV 缺的码。
    机场库由打包脚本(sh)统一 wget 到 local_file，本模块**不联网**。
    正确性第一：**拿不到 / 读不出 CSV 就直接报错退出**（raise SystemExit），不再静默退化到纯内置表——
    宁可打包中断、让人去修 wget，也不要用不完整的映射悄悄产出错数据。
    合并规则：CSV 为准，内置 IATA2CC 只补 CSV 缺的 IATA（setdefault，不覆盖 CSV）。"""
    if not local_file or not os.path.exists(local_file):
        sys.stderr.write(f"[ERR] 机场库 CSV 不存在: {local_file}\n"
                         f"      正确性第一，不退化。请确认 mosdns_config_gen.sh 已 wget airport-codes.csv 到该路径。\n")
        raise SystemExit(2)
    db = {}
    try:
        with open(local_file, "r", encoding="utf-8", newline="") as fh:
            for row in csv.DictReader(fh):
                iata = (row.get("iata_code") or "").strip().upper()
                cc = (row.get("iso_country") or "").strip().upper()
                if len(iata) == 3 and cc:
                    db[iata] = cc
    except Exception as exc:  # noqa: BLE001
        sys.stderr.write(f"[ERR] 机场库读取失败: {exc}\n      正确性第一，不退化，直接退出。\n")
        raise SystemExit(2)
    if not db:
        sys.stderr.write(f"[ERR] 机场库 {local_file} 没解析到任何 iata_code/iso_country（格式不对？）。直接退出。\n")
        raise SystemExit(2)
    sys.stderr.write(f"[OK] 读机场库 {local_file}：IATA 条目 {len(db)}\n")
    before = len(db)
    for k, v in IATA2CC.items():
        db.setdefault(k, v)  # 只补 CSV 缺的（如 6 个都会区/停用码），不覆盖 CSV
    sys.stderr.write(f"[OK] 内置 IATA2CC 补 CSV 缺的 {len(db) - before} 条；IATA 合计 {len(db)}\n")
    return db


def probe_pop(ip, host, timeout):
    """连到指定 IP（SNI/Host=host）发 HEAD，从响应头取 x-amz-cf-pop 的 3 位 IATA。失败返回 None。"""
    ctx = ssl.create_default_context()
    ctx.check_hostname = False
    ctx.verify_mode = ssl.CERT_NONE
    try:
        with socket.create_connection((ip, 443), timeout=timeout) as raw:
            with ctx.wrap_socket(raw, server_hostname=host) as s:
                s.settimeout(timeout)
                req = (
                    f"HEAD / HTTP/1.1\r\nHost: {host}\r\n"
                    f"User-Agent: mosdns-cf-pop/1.0\r\nConnection: close\r\n\r\n"
                )
                s.sendall(req.encode())
                buf = b""
                while b"\r\n\r\n" not in buf and len(buf) < 65536:
                    chunk = s.recv(4096)
                    if not chunk:
                        break
                    buf += chunk
    except Exception:  # noqa: BLE001 - 连不上/超时/TLS 异常都算探测失败
        return None
    m = POP_RE.search(buf)
    return m.group(1).decode().upper() if m else None
