mkdir -p mosdns_config
cd mosdns_config
mkdir -p mosdns_ip/asia/east_asia
mkdir -p mosdns_ip/asia/southeast_asia
mkdir -p mosdns_ip/asia/south_asia
mkdir -p mosdns_ip/asia/middle_east
mkdir -p mosdns_ip/europe/western_europe
mkdir -p mosdns_ip/europe/southern_europe
mkdir -p mosdns_ip/europe/northern_europe
mkdir -p mosdns_ip/europe/eastern_europe
mkdir -p mosdns_ip/north_america
mkdir -p mosdns_ip/south_america
mkdir -p mosdns_ip/africa
mkdir -p mosdns_ip/oceania
mkdir -p mosdns_ip/antarctica
mkdir -p mosdns_site
mkdir -p mosdns_asn
# geoip.dat/geosite.dat 是后面所有 unpack 的根本输入，下不到就直接 error（否则会打出空内容的坏包）
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat || exit 1
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat || exit 1
cd ..

# ============================================================
# 亚洲 (Asia)
# ============================================================

# 东亚 (East Asia)
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/east_asia -f cn mosdns_config/geoip.dat  # 中国
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/east_asia -f hk mosdns_config/geoip.dat  # 香港
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/east_asia -f mo mosdns_config/geoip.dat  # 澳门
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/east_asia -f tw mosdns_config/geoip.dat  # 台湾
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/east_asia -f jp mosdns_config/geoip.dat  # 日本
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/east_asia -f kr mosdns_config/geoip.dat  # 韩国
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/east_asia -f kp mosdns_config/geoip.dat  # 朝鲜
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/east_asia -f mn mosdns_config/geoip.dat  # 蒙古

# 东南亚 (Southeast Asia)
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/southeast_asia -f bn mosdns_config/geoip.dat  # 文莱
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/southeast_asia -f kh mosdns_config/geoip.dat  # 柬埔寨
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/southeast_asia -f id mosdns_config/geoip.dat  # 印度尼西亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/southeast_asia -f la mosdns_config/geoip.dat  # 老挝
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/southeast_asia -f my mosdns_config/geoip.dat  # 马来西亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/southeast_asia -f mm mosdns_config/geoip.dat  # 缅甸
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/southeast_asia -f ph mosdns_config/geoip.dat  # 菲律宾
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/southeast_asia -f sg mosdns_config/geoip.dat  # 新加坡
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/southeast_asia -f th mosdns_config/geoip.dat  # 泰国
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/southeast_asia -f tl mosdns_config/geoip.dat  # 东帝汶
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/southeast_asia -f vn mosdns_config/geoip.dat  # 越南
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/southeast_asia -f cc mosdns_config/geoip.dat  # 科科斯（基林）群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/southeast_asia -f cx mosdns_config/geoip.dat  # 圣诞岛

# 南亚 (South Asia)
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/south_asia -f af mosdns_config/geoip.dat  # 阿富汗
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/south_asia -f bd mosdns_config/geoip.dat  # 孟加拉国
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/south_asia -f bt mosdns_config/geoip.dat  # 不丹
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/south_asia -f in mosdns_config/geoip.dat  # 印度
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/south_asia -f mv mosdns_config/geoip.dat  # 马尔代夫
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/south_asia -f np mosdns_config/geoip.dat  # 尼泊尔
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/south_asia -f pk mosdns_config/geoip.dat  # 巴基斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/south_asia -f lk mosdns_config/geoip.dat  # 斯里兰卡
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/south_asia -f io mosdns_config/geoip.dat  # 英属印度洋领地

# 中东 / 西亚 / 中亚 (Middle East / Western Asia / Central Asia)
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f am mosdns_config/geoip.dat  # 亚美尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f az mosdns_config/geoip.dat  # 阿塞拜疆
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f bh mosdns_config/geoip.dat  # 巴林
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f cy mosdns_config/geoip.dat  # 塞浦路斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f ge mosdns_config/geoip.dat  # 格鲁吉亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f ir mosdns_config/geoip.dat  # 伊朗
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f iq mosdns_config/geoip.dat  # 伊拉克
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f il mosdns_config/geoip.dat  # 以色列
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f jo mosdns_config/geoip.dat  # 约旦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f kz mosdns_config/geoip.dat  # 哈萨克斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f kw mosdns_config/geoip.dat  # 科威特
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f kg mosdns_config/geoip.dat  # 吉尔吉斯斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f lb mosdns_config/geoip.dat  # 黎巴嫩
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f om mosdns_config/geoip.dat  # 阿曼
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f ps mosdns_config/geoip.dat  # 巴勒斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f qa mosdns_config/geoip.dat  # 卡塔尔
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f sa mosdns_config/geoip.dat  # 沙特阿拉伯
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f sy mosdns_config/geoip.dat  # 叙利亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f tj mosdns_config/geoip.dat  # 塔吉克斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f tr mosdns_config/geoip.dat  # 土耳其
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f tm mosdns_config/geoip.dat  # 土库曼斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f ae mosdns_config/geoip.dat  # 阿联酋
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f uz mosdns_config/geoip.dat  # 乌兹别克斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia/middle_east -f ye mosdns_config/geoip.dat  # 也门

# ============================================================
# 欧洲 (Europe)
# ============================================================

# 西欧 (Western Europe)
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/western_europe -f at mosdns_config/geoip.dat  # 奥地利
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/western_europe -f be mosdns_config/geoip.dat  # 比利时
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/western_europe -f fr mosdns_config/geoip.dat  # 法国
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/western_europe -f de mosdns_config/geoip.dat  # 德国
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/western_europe -f ie mosdns_config/geoip.dat  # 爱尔兰
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/western_europe -f li mosdns_config/geoip.dat  # 列支敦士登
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/western_europe -f lu mosdns_config/geoip.dat  # 卢森堡
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/western_europe -f mc mosdns_config/geoip.dat  # 摩纳哥
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/western_europe -f nl mosdns_config/geoip.dat  # 荷兰
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/western_europe -f ch mosdns_config/geoip.dat  # 瑞士
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/western_europe -f gb mosdns_config/geoip.dat  # 英国

# 南欧 (Southern Europe)
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/southern_europe -f al mosdns_config/geoip.dat  # 阿尔巴尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/southern_europe -f ad mosdns_config/geoip.dat  # 安道尔
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/southern_europe -f ba mosdns_config/geoip.dat  # 波黑
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/southern_europe -f hr mosdns_config/geoip.dat  # 克罗地亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/southern_europe -f gi mosdns_config/geoip.dat  # 直布罗陀
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/southern_europe -f gr mosdns_config/geoip.dat  # 希腊
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/southern_europe -f it mosdns_config/geoip.dat  # 意大利
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/southern_europe -f mt mosdns_config/geoip.dat  # 马耳他
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/southern_europe -f me mosdns_config/geoip.dat  # 黑山
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/southern_europe -f mk mosdns_config/geoip.dat  # 北马其顿
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/southern_europe -f pt mosdns_config/geoip.dat  # 葡萄牙
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/southern_europe -f sm mosdns_config/geoip.dat  # 圣马力诺
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/southern_europe -f rs mosdns_config/geoip.dat  # 塞尔维亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/southern_europe -f si mosdns_config/geoip.dat  # 斯洛文尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/southern_europe -f es mosdns_config/geoip.dat  # 西班牙
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/southern_europe -f va mosdns_config/geoip.dat  # 梵蒂冈

# 北欧 (Northern Europe)
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/northern_europe -f dk mosdns_config/geoip.dat  # 丹麦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/northern_europe -f ee mosdns_config/geoip.dat  # 爱沙尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/northern_europe -f fi mosdns_config/geoip.dat  # 芬兰
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/northern_europe -f is mosdns_config/geoip.dat  # 冰岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/northern_europe -f lv mosdns_config/geoip.dat  # 拉脱维亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/northern_europe -f lt mosdns_config/geoip.dat  # 立陶宛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/northern_europe -f no mosdns_config/geoip.dat  # 挪威
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/northern_europe -f se mosdns_config/geoip.dat  # 瑞典
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/northern_europe -f gg mosdns_config/geoip.dat  # 根西岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/northern_europe -f im mosdns_config/geoip.dat  # 马恩岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/northern_europe -f je mosdns_config/geoip.dat  # 泽西岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/northern_europe -f ax mosdns_config/geoip.dat  # 奥兰群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/northern_europe -f fo mosdns_config/geoip.dat  # 法罗群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/northern_europe -f sj mosdns_config/geoip.dat  # 斯瓦尔巴和扬马延

# 东欧 (Eastern Europe)
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/eastern_europe -f by mosdns_config/geoip.dat  # 白俄罗斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/eastern_europe -f bg mosdns_config/geoip.dat  # 保加利亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/eastern_europe -f cz mosdns_config/geoip.dat  # 捷克
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/eastern_europe -f hu mosdns_config/geoip.dat  # 匈牙利
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/eastern_europe -f md mosdns_config/geoip.dat  # 摩尔多瓦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/eastern_europe -f pl mosdns_config/geoip.dat  # 波兰
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/eastern_europe -f ro mosdns_config/geoip.dat  # 罗马尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/eastern_europe -f ru mosdns_config/geoip.dat  # 俄罗斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/eastern_europe -f sk mosdns_config/geoip.dat  # 斯洛伐克
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/eastern_europe -f ua mosdns_config/geoip.dat  # 乌克兰
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe/eastern_europe -f xk mosdns_config/geoip.dat  # 科索沃

# ============================================================
# 北美洲 (North America)
# ============================================================
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f ag mosdns_config/geoip.dat  # 安提瓜和巴布达
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f bs mosdns_config/geoip.dat  # 巴哈马
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f bb mosdns_config/geoip.dat  # 巴巴多斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f bz mosdns_config/geoip.dat  # 伯利兹
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f bm mosdns_config/geoip.dat  # 百慕大
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f vg mosdns_config/geoip.dat  # 英属维尔京群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f ca mosdns_config/geoip.dat  # 加拿大
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f ky mosdns_config/geoip.dat  # 开曼群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f cr mosdns_config/geoip.dat  # 哥斯达黎加
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f cu mosdns_config/geoip.dat  # 古巴
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f cw mosdns_config/geoip.dat  # 库拉索
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f dm mosdns_config/geoip.dat  # 多米尼克
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f do mosdns_config/geoip.dat  # 多米尼加共和国
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f sv mosdns_config/geoip.dat  # 萨尔瓦多
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f gl mosdns_config/geoip.dat  # 格陵兰
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f gd mosdns_config/geoip.dat  # 格林纳达
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f gp mosdns_config/geoip.dat  # 瓜德罗普
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f gt mosdns_config/geoip.dat  # 危地马拉
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f ht mosdns_config/geoip.dat  # 海地
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f hn mosdns_config/geoip.dat  # 洪都拉斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f jm mosdns_config/geoip.dat  # 牙买加
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f mq mosdns_config/geoip.dat  # 马提尼克
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f mx mosdns_config/geoip.dat  # 墨西哥
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f ni mosdns_config/geoip.dat  # 尼加拉瓜
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f pa mosdns_config/geoip.dat  # 巴拿马
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f pr mosdns_config/geoip.dat  # 波多黎各
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f kn mosdns_config/geoip.dat  # 圣基茨和尼维斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f lc mosdns_config/geoip.dat  # 圣卢西亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f vc mosdns_config/geoip.dat  # 圣文森特和格林纳丁斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f sx mosdns_config/geoip.dat  # 荷属圣马丁
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f tt mosdns_config/geoip.dat  # 特立尼达和多巴哥
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f tc mosdns_config/geoip.dat  # 特克斯和凯科斯群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f us mosdns_config/geoip.dat  # 美国
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f vi mosdns_config/geoip.dat  # 美属维尔京群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f aw mosdns_config/geoip.dat  # 阿鲁巴
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f ai mosdns_config/geoip.dat  # 安圭拉
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f ms mosdns_config/geoip.dat  # 蒙特塞拉特
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f bq mosdns_config/geoip.dat  # 荷兰加勒比区
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f bl mosdns_config/geoip.dat  # 圣巴泰勒米
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f mf mosdns_config/geoip.dat  # 法属圣马丁
./v2dat unpack geoip -o mosdns_config/mosdns_ip/north_america -f pm mosdns_config/geoip.dat  # 圣皮埃尔和密克隆

# ============================================================
# 南美洲 (South America)
# ============================================================
./v2dat unpack geoip -o mosdns_config/mosdns_ip/south_america -f ar mosdns_config/geoip.dat  # 阿根廷
./v2dat unpack geoip -o mosdns_config/mosdns_ip/south_america -f bo mosdns_config/geoip.dat  # 玻利维亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/south_america -f br mosdns_config/geoip.dat  # 巴西
./v2dat unpack geoip -o mosdns_config/mosdns_ip/south_america -f cl mosdns_config/geoip.dat  # 智利
./v2dat unpack geoip -o mosdns_config/mosdns_ip/south_america -f co mosdns_config/geoip.dat  # 哥伦比亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/south_america -f ec mosdns_config/geoip.dat  # 厄瓜多尔
./v2dat unpack geoip -o mosdns_config/mosdns_ip/south_america -f fk mosdns_config/geoip.dat  # 福克兰群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/south_america -f gf mosdns_config/geoip.dat  # 法属圭亚那
./v2dat unpack geoip -o mosdns_config/mosdns_ip/south_america -f gy mosdns_config/geoip.dat  # 圭亚那
./v2dat unpack geoip -o mosdns_config/mosdns_ip/south_america -f py mosdns_config/geoip.dat  # 巴拉圭
./v2dat unpack geoip -o mosdns_config/mosdns_ip/south_america -f pe mosdns_config/geoip.dat  # 秘鲁
./v2dat unpack geoip -o mosdns_config/mosdns_ip/south_america -f sr mosdns_config/geoip.dat  # 苏里南
./v2dat unpack geoip -o mosdns_config/mosdns_ip/south_america -f uy mosdns_config/geoip.dat  # 乌拉圭
./v2dat unpack geoip -o mosdns_config/mosdns_ip/south_america -f ve mosdns_config/geoip.dat  # 委内瑞拉

# ============================================================
# 非洲 (Africa)
# ============================================================
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f dz mosdns_config/geoip.dat  # 阿尔及利亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f ao mosdns_config/geoip.dat  # 安哥拉
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f bj mosdns_config/geoip.dat  # 贝宁
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f bw mosdns_config/geoip.dat  # 博茨瓦纳
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f bf mosdns_config/geoip.dat  # 布基纳法索
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f bi mosdns_config/geoip.dat  # 布隆迪
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f cv mosdns_config/geoip.dat  # 佛得角
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f cm mosdns_config/geoip.dat  # 喀麦隆
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f cf mosdns_config/geoip.dat  # 中非共和国
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f td mosdns_config/geoip.dat  # 乍得
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f km mosdns_config/geoip.dat  # 科摩罗
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f cg mosdns_config/geoip.dat  # 刚果（布）{刚果共和国}
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f cd mosdns_config/geoip.dat  # 刚果（金）{刚果民主共和国}
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f ci mosdns_config/geoip.dat  # 科特迪瓦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f dj mosdns_config/geoip.dat  # 吉布提
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f eg mosdns_config/geoip.dat  # 埃及
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f gq mosdns_config/geoip.dat  # 赤道几内亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f er mosdns_config/geoip.dat  # 厄立特里亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f sz mosdns_config/geoip.dat  # 埃斯瓦蒂尼
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f et mosdns_config/geoip.dat  # 埃塞俄比亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f ga mosdns_config/geoip.dat  # 加蓬
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f gm mosdns_config/geoip.dat  # 冈比亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f gh mosdns_config/geoip.dat  # 加纳
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f gn mosdns_config/geoip.dat  # 几内亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f gw mosdns_config/geoip.dat  # 几内亚比绍
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f ke mosdns_config/geoip.dat  # 肯尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f ls mosdns_config/geoip.dat  # 莱索托
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f lr mosdns_config/geoip.dat  # 利比里亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f ly mosdns_config/geoip.dat  # 利比亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f mg mosdns_config/geoip.dat  # 马达加斯加
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f mw mosdns_config/geoip.dat  # 马拉维
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f ml mosdns_config/geoip.dat  # 马里
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f mr mosdns_config/geoip.dat  # 毛里塔尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f mu mosdns_config/geoip.dat  # 毛里求斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f yt mosdns_config/geoip.dat  # 马约特
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f ma mosdns_config/geoip.dat  # 摩洛哥
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f mz mosdns_config/geoip.dat  # 莫桑比克
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f na mosdns_config/geoip.dat  # 纳米比亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f ne mosdns_config/geoip.dat  # 尼日尔
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f ng mosdns_config/geoip.dat  # 尼日利亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f re mosdns_config/geoip.dat  # 留尼汪
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f rw mosdns_config/geoip.dat  # 卢旺达
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f st mosdns_config/geoip.dat  # 圣多美和普林西比
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f sn mosdns_config/geoip.dat  # 塞内加尔
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f sc mosdns_config/geoip.dat  # 塞舌尔
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f sl mosdns_config/geoip.dat  # 塞拉利昂
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f so mosdns_config/geoip.dat  # 索马里
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f za mosdns_config/geoip.dat  # 南非
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f ss mosdns_config/geoip.dat  # 南苏丹
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f sd mosdns_config/geoip.dat  # 苏丹
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f tz mosdns_config/geoip.dat  # 坦桑尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f tg mosdns_config/geoip.dat  # 多哥
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f tn mosdns_config/geoip.dat  # 突尼斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f ug mosdns_config/geoip.dat  # 乌干达
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f zm mosdns_config/geoip.dat  # 赞比亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f zw mosdns_config/geoip.dat  # 津巴布韦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f sh mosdns_config/geoip.dat  # 圣赫勒拿
./v2dat unpack geoip -o mosdns_config/mosdns_ip/africa -f eh mosdns_config/geoip.dat  # 西撒哈拉

# ============================================================
# 大洋洲 (Oceania)
# ============================================================
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f au mosdns_config/geoip.dat  # 澳大利亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f fj mosdns_config/geoip.dat  # 斐济
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f ki mosdns_config/geoip.dat  # 基里巴斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f mh mosdns_config/geoip.dat  # 马绍尔群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f fm mosdns_config/geoip.dat  # 密克罗尼西亚联邦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f nr mosdns_config/geoip.dat  # 瑙鲁
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f nz mosdns_config/geoip.dat  # 新西兰
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f pw mosdns_config/geoip.dat  # 帕劳
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f pg mosdns_config/geoip.dat  # 巴布亚新几内亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f ws mosdns_config/geoip.dat  # 萨摩亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f sb mosdns_config/geoip.dat  # 所罗门群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f to mosdns_config/geoip.dat  # 汤加
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f tv mosdns_config/geoip.dat  # 图瓦卢
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f vu mosdns_config/geoip.dat  # 瓦努阿图
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f nc mosdns_config/geoip.dat  # 新喀里多尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f pf mosdns_config/geoip.dat  # 法属波利尼西亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f gu mosdns_config/geoip.dat  # 关岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f as mosdns_config/geoip.dat  # 美属萨摩亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f mp mosdns_config/geoip.dat  # 北马里亚纳群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f ck mosdns_config/geoip.dat  # 库克群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f nu mosdns_config/geoip.dat  # 纽埃
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f tk mosdns_config/geoip.dat  # 托克劳
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f wf mosdns_config/geoip.dat  # 瓦利斯和富图纳
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f nf mosdns_config/geoip.dat  # 诺福克岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f pn mosdns_config/geoip.dat  # 皮特凯恩群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/oceania -f um mosdns_config/geoip.dat  # 美国本土外小岛屿

# ============================================================
# 南极洲 (Antarctica) — 科考站有网络
# ============================================================
./v2dat unpack geoip -o mosdns_config/mosdns_ip/antarctica -f aq mosdns_config/geoip.dat  # 南极洲
./v2dat unpack geoip -o mosdns_config/mosdns_ip/antarctica -f bv mosdns_config/geoip.dat  # 布威岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/antarctica -f gs mosdns_config/geoip.dat  # 南乔治亚和南桑威奇群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/antarctica -f hm mosdns_config/geoip.dat  # 赫德岛和麦克唐纳群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/antarctica -f tf mosdns_config/geoip.dat  # 法属南部和南极领地


./v2dat unpack geoip -o mosdns_config/mosdns_ip -f cloudflare mosdns_config/geoip.dat
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f cloudfront mosdns_config/geoip.dat
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f facebook mosdns_config/geoip.dat
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f fastly mosdns_config/geoip.dat
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f google mosdns_config/geoip.dat
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f netflix mosdns_config/geoip.dat
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f telegram mosdns_config/geoip.dat
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f twitter mosdns_config/geoip.dat
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f private mosdns_config/geoip.dat
# note: align with Loyalsoldier, 把新加的类也转出来
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f tor mosdns_config/geoip.dat

# geosite start

# GAME
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f category-games@cn mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f category-games mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f category-games-!cn mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f category-games-cn mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f category-game-accelerator-cn mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f steamunlocked mosdns_config/geosite.dat

./v2dat unpack geosite  -o mosdns_config/mosdns_site -f ea mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f ubisoft mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f rockstar mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f epicgames mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f nintendo mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f playstation mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f xbox mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f steam mosdns_config/geosite.dat

# ADS
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f category-ads-all mosdns_config/geosite.dat

# TLD-CN
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f tld-cn mosdns_config/geosite.dat

#APPLE
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f apple-cn mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f icloud mosdns_config/geosite.dat

#jetbrain
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f jetbrains mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f jetbrains-ai mosdns_config/geosite.dat

# SOCIAL
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f telegram mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f whatsapp mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f meta mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f twitter mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f instagram mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f facebook mosdns_config/geosite.dat

# CDN
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f cloudflare mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f cloudfront mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f akamai mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f fastly mosdns_config/geosite.dat

# gfw
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f gfw mosdns_config/geosite.dat

# 常用
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f youtube mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f google mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f netflix mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f linkedin mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f docker mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f gravatar mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f microsoft mosdns_config/geosite.dat

## CN
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f cn mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f geolocation-cn mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f geolocation-!cn mosdns_config/geosite.dat

./v2dat unpack geosite  -o mosdns_config/mosdns_site -f alibaba mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f alibabacloud mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f aliyun mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f ali213 mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f alibaba-ads mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f tencent mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f tencent-ads mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f tencent-dev mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f tencent-games mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f netease mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f xunlei mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f bilibili mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f bilibili-game mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f bilibili2 mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f bytedance mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f tiktok mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f bytedance-ads mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f baidu mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f baidu-ads mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f iflytek mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f zhihu mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f huya mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f douyu mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f huawei mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f huawei-dev mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f huaweicloud mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f xiaomi mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f oppo mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f kingsoft mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f lenovo mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f xiaohongshu mosdns_config/geosite.dat

## AI
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f category-ai-!cn mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f category-ai-cn mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f openai mosdns_config/geosite.dat

## webdisk
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f mega mosdns_config/geosite.dat

## jp
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f dmm mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f abema mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f tver mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f japonx mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f niconico mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f line mosdns_config/geosite.dat

## porn
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f ehentai mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f missav mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f pornhub mosdns_config/geosite.dat

##dev
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f github mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f category-dev mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f category-dev-cn mosdns_config/geosite.dat

## developers.facebook.com 从 dev 剔除：它只是 Meta 开发者门户(Graph API/应用控制台/SDK/webhook)，
## 不开发 FB 插件就用不到。剔除后由 social_video(facebook_site 的 facebook.com 后缀) 收 -> hk2，
## 与 facebook 行为统一；否则 dev_site 在 main_sequence 先于 social_video，会把它抢去地区级联造成双 FA
# note: meta 相关逻辑目前都不启用
# sed -i '/developers\.facebook\.com/d' mosdns_config/mosdns_site/category-dev.txt

## §3 social_video 追加「实测落在 Meta 自有 AS32934 边缘」的其余 Meta 域名（DoH + ASN 实测）：
##   threads.net 185.60.218.x / threads.com 57.144.206.x、www.oculus.com->oculus.c10r.facebook.com 157.240.241.x、
##   messenger.com 157.240.27.x、meta.com 157.240.11.x、workplace.com 57.144.204.x、meta.ai 57.144.202.x、llama.com 185.60.218.x，
##   全落 157.240.0.0/16 + 57.144.0.0/14 + 185.60.216.0/22 —— 与 facebook 同一张边缘 VIP 池、可能复用同一 /32，
##   必须与 facebook 同 FA(hk2)，否则区域路径会把同 /32 劈成 hk2 vs us/jp 双 FA。meta.ai/llama.com 在 AS32934，
##   同样进 hk2（不能进 ai_site->us，否则与 facebook 复用同 /32 双 FA）。
##   ⚠ 只手列 AS32934 自有边缘域名、**不整包用 meta.txt**：Meta 的 OSS/文档站(react/reactjs/recoil/rocksdb/yoga/
##   flow/flowtype/hhvm/fbinfer/fblitho/fbredex/frescolib/hacklang/draftjs/fasttext/buck/mcrouter/ogp/opengraphprotocol/
##   parse/pyrobot/makeitopen…) 全在第三方共享 CDN(Cloudflare AS13335 / Vercel AS16509 / GitHub Pages 185.199.108/22)，
##   它们与 hk2 成员(Meta/Twitter/Netflix/Google)AS 完全不相交、本就 region 路由不会撞；但若误进 hk2 会与同 CDN
##   其他租户(非 Meta 站)同 /32 撞 FA，故绝不并入。react.* 另在 category-dev -> dev_site 已按区处理。
## ⚠ 整组同进退、**不能单拎一个域名走**：这些全在 Meta 自有 AS32934 同一张边缘 VIP 池里轮换（和 facebook/ig/wa 共用），
##   FA 是按「解析到的 /32」决定的——同一个 /32 今天可能解析自 facebook、明天解析自 llama。所以只要 facebook 在 hk2，
##   meta.ai/llama.com 就**必须**也在 hk2。单独删 llama.com 这行让它走 $final/区域，只会让它落到的某个 Meta /32 同时被
##   hk2(facebook) 和 hk1/us(llama) 两个 FA 占用 = 我们这轮一直在消灭的 split-brain（verify_fa.py 报 ERROR）。
##   真要把 Meta 边缘挪出 hk2，得**整组 AS32934（连 facebook/ig/wa）一起挪**——那是另一个大决策，不是删一行。
##   （补充：llama.com 只是门户、流量很小；真正下模型走的是另外的下载 CDN、按区域独立路由，没有"高频"理由非挪它。）
# note: meta 相关逻辑目前都不启用
#cat > mosdns_config/mosdns_site/meta_net.txt <<'EOF'
#threads.net
#threads.com
#oculus.com
#messenger.com
#meta.com
#workplace.com
#meta.ai
#llama.com
#EOF

## asn list, special asn to process
wget -O mosdns_config/mosdns_asn/peekabo.txt https://as.090227.xyz/AS402075
wget -O mosdns_config/mosdns_asn/neburst.txt https://as.090227.xyz/AS8143
wget -O mosdns_config/mosdns_asn/gomami.txt https://as.090227.xyz/AS36002
wget -O mosdns_config/mosdns_asn/sharon.txt https://as.090227.xyz/AS396856

mv mosdns_config/mosdns_site/cn.txt mosdns_config/mosdns_site/cn_site.txt
cp mosdns_config/mosdns_ip/asia/east_asia/cn.txt mosdns_config/mosdns_ip/cn_ip.txt
mv mosdns_config/mosdns_site/cloudflare.txt mosdns_config/mosdns_site/cloudflare_site.txt
mv mosdns_config/mosdns_ip/cloudflare.txt mosdns_config/mosdns_ip/cloudflare_ip.txt
mv mosdns_config/mosdns_site/cloudfront.txt mosdns_config/mosdns_site/cloudfront_site.txt
mv mosdns_config/mosdns_ip/cloudfront.txt mosdns_config/mosdns_ip/cloudfront_ip.txt
mv mosdns_config/mosdns_site/facebook.txt mosdns_config/mosdns_site/facebook_site.txt
mv mosdns_config/mosdns_ip/facebook.txt mosdns_config/mosdns_ip/facebook_ip.txt
mv mosdns_config/mosdns_site/fastly.txt mosdns_config/mosdns_site/fastly_site.txt
mv mosdns_config/mosdns_ip/fastly.txt mosdns_config/mosdns_ip/fastly_ip.txt
mv mosdns_config/mosdns_site/google.txt mosdns_config/mosdns_site/google_site.txt
mv mosdns_config/mosdns_ip/google.txt mosdns_config/mosdns_ip/google_ip.txt
mv mosdns_config/mosdns_site/netflix.txt mosdns_config/mosdns_site/netflix_site.txt
mv mosdns_config/mosdns_ip/netflix.txt mosdns_config/mosdns_ip/netflix_ip.txt
mv mosdns_config/mosdns_site/telegram.txt mosdns_config/mosdns_site/telegram_site.txt
mv mosdns_config/mosdns_ip/telegram.txt mosdns_config/mosdns_ip/telegram_ip.txt
mv mosdns_config/mosdns_site/twitter.txt mosdns_config/mosdns_site/twitter_site.txt
mv mosdns_config/mosdns_ip/twitter.txt mosdns_config/mosdns_ip/twitter_ip.txt
mv mosdns_config/mosdns_ip/private.txt mosdns_config/mosdns_ip/private_ip.txt

# ============================================================
# §6 CDN IP 抽取 + CloudFront/AWS 按国家分类（纯数据，不读 yaml、不认识 FA、不做区域分区）
# 必须在上面那批 mv（重命名 *_ip.txt）之后、rm/zip 之前。
# 注：区域聚合(hk/jp/us/eu_region)、hk_cdn_ip、aws_hk_ip 已移除（流量分区改由上层自行处理）。
#     产出的原始素材（供上层 yaml 自行拼流量区块）：
#       - cloudfront_global.txt         CloudFront 全局边缘池 = 需探测的输入（⓪ 从 ip-ranges 抽）
#       - cloudfront_region/<cc>.txt    CloudFront 具体 region 段按国家（权威，无需探测；⓪ 产出）
#       - cloudfront_origin_facing.txt  CloudFront 回源出口段（存档；⓪ 产出）
#       - ga_anycast.txt                Global Accelerator 真 anycast 段（就近直连、不探不分国；⓪ 产出）
#       - cloudfront_pop/<cc>.txt + no_response.txt/unknown_iata.txt  CloudFront 按真实 POP 国家
#                                       （快版探 global，每次打包；见①。后两个文件不进路由，只供①.6 对照）
#       - cloudfront_pop_full/<cc>.txt + no_response.txt/unknown_iata.txt  逐 IP 全量抓取（可选，见①.5，低频单独跑）
#       - aws_cc/<cc>.txt               AWS 按 region→国家（权威，无需探测；见④）
#       - cdn_ip_all.txt / gfe_ip.txt / azure_fd_ip.txt   CDN 全集 / GFE / Azure FD
#       - geoip 的 mosdns_ip/<洲>/<国>.txt（各国段）
# ============================================================
IPDIR=mosdns_config/mosdns_ip

# 机场库 CSV（IATA->国家）：和 geoip/asn 一样在这儿统一 wget 到本地，py 只读它、不再自己联网（URL 不藏在 py 里）。
wget -O $IPDIR/airport-codes.csv \
  https://raw.githubusercontent.com/datasets/airport-codes/master/data/airport-codes.csv

# ⓪ 从 AWS 官方 ip-ranges.json 拆 CloudFront / Global Accelerator（权威、几秒）：
#   实测 Loyalsoldier 的 cloudfront == AWS 官方 CLOUDFRONT+ORIGIN_FACING（覆盖 IP 100% 相同），故用官方源、
#   且自带 GLOBAL/region 标签。有 region 的直接权威分国、只有 GLOBAL 才需探测：
#     - cloudfront_global.txt        CLOUDFRONT 的 GLOBAL 全局边缘池 = **唯一需要探测**的部分（①/①.5 的输入）
#     - cloudfront_region/<cc>.txt   CLOUDFRONT 具体 region 段按国家（权威，独立，不必探）
#     - cloudfront_origin_facing.txt CLOUDFRONT_ORIGIN_FACING 回源出口段（存档，一般不进客户端路由）
#     - ga_anycast.txt               GLOBALACCELERATOR = 真 anycast（BGP 就近入网，像 Cloudflare/GFE，
#                                    见 gen_cloudfront_split.py 头部官方链接）；整体存档、就近直连、不探不分国
python3 "$(dirname "$0")/gen_cloudfront_split.py" \
  --aws-json https://ip-ranges.amazonaws.com/ip-ranges.json \
  --out-global $IPDIR/cloudfront_global.txt \
  --out-region-dir $IPDIR/cloudfront_region \
  --out-origin-facing $IPDIR/cloudfront_origin_facing.txt \
  --out-ga $IPDIR/ga_anycast.txt || exit 1

# ① CloudFront 全局边缘池按真实 POP 国家分类（快版，每次打包）：
#   geoip 把大量 CloudFront 边缘段标错国家（如香港 POP 段被标 US）。gen_cloudfront_pop.py 探测每个 /24 的
#   x-amz-cf-pop（POP 城市，权威）-> IATA -> 国家，每国落 mosdns_ip/cloudfront_pop/<cc>.txt。**只探 ⓪ 抽出的
#   cloudfront_global.txt**（region 段已由 ⓪ 权威分好，无需探）。IATA->国家读上面 wget 的 --iata-db（拿不到 CSV 直接报错退出，不退化）。
#   只处理 IPv4；网络退化自动跳过。
#   CSV 拿不到 -> gen_cloudfront_pop 的 build_iata_db 直接 error 退出，这里 || exit 1 中断整包（正确性第一，
#   宁可不打包也不要产出缺 cloudfront_pop 的坏包）。若探不到 POP（纯网络退化）脚本自身返回 0，不会误伤。
#   --max-probes-per-24：每个 /24 依次试 .1 -> .129 -> .65 … 最多 8 个代表 IP，命中即停；全不应答才落 no_response.txt。
#     只试 .1 的话，.1 恰好不应答就整段白丢：拿 full 缓存重放实测 16,423 个单元里，只试 1 个 = 10,567 段命中，
#     试 8 个 = 10,819 段（连整个 CN 的 POP 段都是这么捡回来的，那几段 .1 不应答），试满 254 个 = 10,864 段。
#     代价全落在整段全死的 /24 上（每段白试满 8 次），探测次数 16,423 -> 56,343，所以并发从 64 提到 256
#     （和 ①.5 full 版同档），墙钟仍是十几分钟量级。想更省就调小 K，目前 100%  --max-probes-per-24 0 (只有 1% 会整个 /24）
python3 "$(dirname "$0")/gen_cloudfront_pop.py" \
  --cloudfront-ip $IPDIR/cloudfront_global.txt \
  --out-dir $IPDIR/cloudfront_pop \
  --iata-db $IPDIR/airport-codes.csv \
  --max-probes-per-24 0 \
  --concurrency 256 --timeout 5 || exit 1

# ①.5（可选，低频单独跑，别放进每次打包）逐 IP 全量抓取版：把 cloudfront_global 每个 IP 都探一遍，
#   **不做 /24 假设**——有响应按 cf-pop 国家、相邻同国能合多大合多大；探了没响应的 IP 单列 no_response.txt；
#   .0/.255 仅在同国 /24 内桥接。几小时级、带断点续跑(--cache 必填，可随时 Ctrl-C 续跑；合并流式读 --cache)。
#   用独立 out-dir，别让①的快版覆盖。--cache 不存在会自动建；--iata-db 用上面 wget 的机场库。仅重合并加 --merge-only。
# python3 "$(dirname "$0")/gen_cloudfront_pop_full.py" \
#   --cloudfront-ip $IPDIR/cloudfront_global.txt \
#   --out-dir $IPDIR/cloudfront_pop_full \
#   --cache $IPDIR/cft_pop_full_cache.tsv \
#   --iata-db $IPDIR/airport-codes.csv \
#   --concurrency 256 --timeout 3

# ①.6（可选）对照 快版 vs full 版，查快版 /24 假设有没有漏网（独立脚本，只读①/①.5 产物+缓存，不重探）：
#   跨 POP 的 /24 = 快版会整段误判的漏网点，**用「逐 IP 缓存」和「full 产物 <cc>.txt」两条路径各算一遍互相印证**，
#   两边都为 0 才说明快版「一个 /24 = 一个 POP」假设全对。
#   每国那张表里「仅快版」还会按 full 的 no_response.txt / unknown_iata.txt 拆开：只有 X（full 判给别国）才是真误判，
#   nr（full 探过无响应、快版按 /24 整段填充）属预期行为。2026-08 实测：X=0，多算的 99.98% 都是 nr。
# python3 "$(dirname "$0")/cft_pop_compare.py" \
#   --quick-dir $IPDIR/cloudfront_pop --full-dir $IPDIR/cloudfront_pop_full \
#   --full-cache $IPDIR/cft_pop_full_cache.tsv --iata-db $IPDIR/airport-codes.csv

## social_video 自有 IP 段（仅存档/备查，yaml 不引用）：
##   whatsapp/instagram/facebook 同属 Meta AS32934（IP 层无法拆分，facebook_ip 即整段 Meta）；
##   twitter AS13414、netflix AS2906；googlevideo 是 Google 子集、无独立 geoip 类目，故不含。
# note video 相关逻辑先不启用
#cat $IPDIR/facebook_ip.txt $IPDIR/twitter_ip.txt $IPDIR/netflix_ip.txt > $IPDIR/social_video_ip.txt

# —— 各 CDN 的 IP 来源与官方源对照（2026-07 实测；现在先不切官方，留注释方便以后改）——
#   cloudflare / cloudfront / fastly：现在取自 geoip.dat（Loyalsoldier，见前面 v2dat unpack）。实测 vs 各自官方源：
#     cloudfront  Loyalsoldier == AWS 官方 CLOUDFRONT+ORIGIN_FACING（100% 相同）；本项目已改从 AWS ip-ranges 直取（见 ⓪）
#     cloudflare  官方 v4≈1,524,736  Loyalsoldier≈1,942,016  交集=官方全部  仅官方=0  仅Loyalsoldier≈417,280（超集，偏宽）
#     fastly      官方 v4≈  304,128  Loyalsoldier≈  374,528  交集=官方全部  仅官方=0  仅Loyalsoldier≈ 70,400（超集，偏宽）
#   => Loyalsoldier 是官方的「超集」（含官方 100%，另多收了非边缘段）。要更精确可切各自官方源（现成、更实时）：
#     cloudflare : https://www.cloudflare.com/ips-v4   和   https://www.cloudflare.com/ips-v6   （纯文本，一行一个 CIDR）
#     fastly     : https://api.fastly.com/public-ip-list                                        （JSON: {addresses[], ipv6_addresses[]}）
#     cloudfront : https://ip-ranges.amazonaws.com/ip-ranges.json（service=CLOUDFRONT；本项目 ⓪ 已用官方）
#   要切：把前面 geoip unpack 的 cloudflare/fastly 换成 wget 上述 URL 落成 *_ip.txt 即可（cloudfront 已是官方，无需动）。
#
# ② 大 CDN 的 ASN 段（没有规范官方全量列表的那几家，用 as.090227.xyz 按 ASN 抽即可，够用；
#   bunny 另有可选官方 edge API https://api.bunny.net/system/edgeserverlist，想更准可换）。一行一个 CDN，增删即改此表：
declare -A CDN_ASN=(
  [akamai]="AS20940 AS16625"      # Akamai
  [edgio]="AS15133 AS22822"       # Edgio/EdgeCast + Limelight
  [gcore]="AS199524"              # Gcore
  [cdn77]="AS60068"               # CDN77
  [bunny]="AS200325"              # BunnyCDN
)
for name in "${!CDN_ASN[@]}"; do
  : > $IPDIR/${name}_ip.txt
  for asn in ${CDN_ASN[$name]}; do wget -qO- https://as.090227.xyz/$asn >> $IPDIR/${name}_ip.txt; done
done

# ③ 抽 CDN IP 全集：cdn_ip_all = 各 CDN ∪ gfe(goog−cloud) ∪ azure_fd(ServiceTags)。均在 py 内处理。
#    gen_cdn_sets.py 与本脚本同目录；只做拉源/合并/落盘，不做区域分区。gfe/azure/cdn_ip_all 供上层分区/verify。
python3 "$(dirname "$0")/gen_cdn_sets.py" \
  --cdn $IPDIR/cloudflare_ip.txt $IPDIR/cloudfront_ip.txt $IPDIR/fastly_ip.txt \
        $IPDIR/akamai_ip.txt $IPDIR/edgio_ip.txt $IPDIR/gcore_ip.txt $IPDIR/cdn77_ip.txt $IPDIR/bunny_ip.txt \
  --gfe-from-google --azure-front-door \
  --out-cdn-all $IPDIR/cdn_ip_all.txt \
  --out-gfe $IPDIR/gfe_ip.txt --out-azure $IPDIR/azure_fd_ip.txt || exit 1

# ④ AWS 按 region→国家分类（权威、无需探测、几秒钟）：ip-ranges.json 每条前缀自带 region，region 是地理
#   固定的单播（ap-east-1=香港、ap-northeast-1=东京、us-*=美国…），直接映射到国家。已排除
#   CLOUDFRONT/GLOBALACCELERATOR（边缘/anycast，已由 ⓪ gen_cloudfront_split.py 单独拆分处理）。每国落 aws_cc/<cc>.txt。
#   region→国家表见 gen_aws_region.AWS_REGION2CC；已补 ap-east-2=台北(TW)、ap-southeast-6=新西兰(NZ)、
#   eusc-de-east-1=主权云德国(DE)、sa-west-1=智利(CL)、us-south-1=美国。me-west-1 官方 region 表暂无、归属未定，
#   故不映射（脚本会 [WARN] 告警，将来 AWS 明确了补一行即可）。
#   想要更细（区分 us-east/us-west 等）就把 --group 换成 region -> aws_cc/<region>.txt。网络退化自动跳过。
python3 "$(dirname "$0")/gen_aws_region.py" \
  --aws-json https://ip-ranges.amazonaws.com/ip-ranges.json \
  --out-dir $IPDIR/aws_cc --group country || exit 1

# ⑤（可选，默认不开）Azure 按 region→国家：ServiceTags 每条自带 region（eastasia=香港、japaneast=东京、
#   taiwannorth=台湾…），能像 AWS 一样权威分国。但规模很大（实测 77 region / ~4.5 万条前缀），且这些是 Azure
#   云主机段（不是 CDN），故默认注释、按需开启。AzureFrontDoor/CDN 那批全球 anycast 边缘不在这里、已由 ③ 的
#   azure_fd 收（gen_azure_region.py 会自动跳过）。默认自动发现 ServiceTags；产出 aws 同款 azure_cc/<cc>.txt。
# python3 "$(dirname "$0")/gen_azure_region.py" \
#   --out-dir $IPDIR/azure_cc

rm mosdns_config/geosite.dat
rm mosdns_config/geoip.dat
# airport-codes.csv 只是 ①/④ 用的 IATA->国家中间输入（~5MB），不进最终发布包
rm -f mosdns_config/mosdns_ip/airport-codes.csv
zip -r mosdns_rule.zip mosdns_config/ || { echo "[FATAL] zip 打包失败"; exit 1; }
# 没打成功包（zip 缺失或为空）就直接 error，绝不产出坏包
[ -s mosdns_rule.zip ] || { echo "[FATAL] mosdns_rule.zip 未生成或为空"; exit 1; }

cd mosdns_config
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat
cd ..

cp mosdns_rule.zip mosdns_config/ || exit 1
