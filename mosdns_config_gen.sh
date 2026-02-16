mkdir -p mosdns_config
cd mosdns_config
mkdir -p mosdns_ip/asia
mkdir -p mosdns_ip/europe
mkdir -p mosdns_ip/north_america
mkdir -p mosdns_ip/south_america
mkdir -p mosdns_ip/africa
mkdir -p mosdns_ip/oceania
mkdir -p mosdns_ip/antarctica
mkdir -p mosdns_site
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat
cd ..

# ============================================================
# 亚洲 (Asia)
# ============================================================
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f af mosdns_config/geoip.dat  # 阿富汗
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f am mosdns_config/geoip.dat  # 亚美尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f az mosdns_config/geoip.dat  # 阿塞拜疆
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f bh mosdns_config/geoip.dat  # 巴林
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f bd mosdns_config/geoip.dat  # 孟加拉国
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f bt mosdns_config/geoip.dat  # 不丹
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f bn mosdns_config/geoip.dat  # 文莱
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f kh mosdns_config/geoip.dat  # 柬埔寨
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f cn mosdns_config/geoip.dat  # 中国
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f cy mosdns_config/geoip.dat  # 塞浦路斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f ge mosdns_config/geoip.dat  # 格鲁吉亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f hk mosdns_config/geoip.dat  # 香港
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f in mosdns_config/geoip.dat  # 印度
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f id mosdns_config/geoip.dat  # 印度尼西亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f ir mosdns_config/geoip.dat  # 伊朗
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f iq mosdns_config/geoip.dat  # 伊拉克
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f il mosdns_config/geoip.dat  # 以色列
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f jp mosdns_config/geoip.dat  # 日本
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f jo mosdns_config/geoip.dat  # 约旦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f kz mosdns_config/geoip.dat  # 哈萨克斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f kw mosdns_config/geoip.dat  # 科威特
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f kg mosdns_config/geoip.dat  # 吉尔吉斯斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f la mosdns_config/geoip.dat  # 老挝
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f lb mosdns_config/geoip.dat  # 黎巴嫩
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f mo mosdns_config/geoip.dat  # 澳门
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f my mosdns_config/geoip.dat  # 马来西亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f mv mosdns_config/geoip.dat  # 马尔代夫
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f mn mosdns_config/geoip.dat  # 蒙古
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f mm mosdns_config/geoip.dat  # 缅甸
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f np mosdns_config/geoip.dat  # 尼泊尔
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f kp mosdns_config/geoip.dat  # 朝鲜
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f om mosdns_config/geoip.dat  # 阿曼
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f pk mosdns_config/geoip.dat  # 巴基斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f ps mosdns_config/geoip.dat  # 巴勒斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f ph mosdns_config/geoip.dat  # 菲律宾
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f qa mosdns_config/geoip.dat  # 卡塔尔
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f sa mosdns_config/geoip.dat  # 沙特阿拉伯
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f sg mosdns_config/geoip.dat  # 新加坡
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f kr mosdns_config/geoip.dat  # 韩国
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f lk mosdns_config/geoip.dat  # 斯里兰卡
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f sy mosdns_config/geoip.dat  # 叙利亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f tw mosdns_config/geoip.dat  # 台湾
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f tj mosdns_config/geoip.dat  # 塔吉克斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f th mosdns_config/geoip.dat  # 泰国
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f tl mosdns_config/geoip.dat  # 东帝汶
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f tr mosdns_config/geoip.dat  # 土耳其
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f tm mosdns_config/geoip.dat  # 土库曼斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f ae mosdns_config/geoip.dat  # 阿联酋
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f uz mosdns_config/geoip.dat  # 乌兹别克斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f vn mosdns_config/geoip.dat  # 越南
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f ye mosdns_config/geoip.dat  # 也门
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f cc mosdns_config/geoip.dat  # 科科斯（基林）群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f cx mosdns_config/geoip.dat  # 圣诞岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/asia -f io mosdns_config/geoip.dat  # 英属印度洋领地

# ============================================================
# 欧洲 (Europe)
# ============================================================
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f al mosdns_config/geoip.dat  # 阿尔巴尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f ad mosdns_config/geoip.dat  # 安道尔
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f at mosdns_config/geoip.dat  # 奥地利
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f by mosdns_config/geoip.dat  # 白俄罗斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f be mosdns_config/geoip.dat  # 比利时
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f ba mosdns_config/geoip.dat  # 波黑
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f bg mosdns_config/geoip.dat  # 保加利亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f hr mosdns_config/geoip.dat  # 克罗地亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f cz mosdns_config/geoip.dat  # 捷克
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f dk mosdns_config/geoip.dat  # 丹麦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f ee mosdns_config/geoip.dat  # 爱沙尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f fi mosdns_config/geoip.dat  # 芬兰
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f fr mosdns_config/geoip.dat  # 法国
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f de mosdns_config/geoip.dat  # 德国
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f gi mosdns_config/geoip.dat  # 直布罗陀
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f gr mosdns_config/geoip.dat  # 希腊
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f gg mosdns_config/geoip.dat  # 根西岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f hu mosdns_config/geoip.dat  # 匈牙利
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f is mosdns_config/geoip.dat  # 冰岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f ie mosdns_config/geoip.dat  # 爱尔兰
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f im mosdns_config/geoip.dat  # 马恩岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f it mosdns_config/geoip.dat  # 意大利
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f je mosdns_config/geoip.dat  # 泽西岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f xk mosdns_config/geoip.dat  # 科索沃
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f lv mosdns_config/geoip.dat  # 拉脱维亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f li mosdns_config/geoip.dat  # 列支敦士登
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f lt mosdns_config/geoip.dat  # 立陶宛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f lu mosdns_config/geoip.dat  # 卢森堡
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f mt mosdns_config/geoip.dat  # 马耳他
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f md mosdns_config/geoip.dat  # 摩尔多瓦
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f mc mosdns_config/geoip.dat  # 摩纳哥
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f me mosdns_config/geoip.dat  # 黑山
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f nl mosdns_config/geoip.dat  # 荷兰
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f mk mosdns_config/geoip.dat  # 北马其顿
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f no mosdns_config/geoip.dat  # 挪威
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f pl mosdns_config/geoip.dat  # 波兰
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f pt mosdns_config/geoip.dat  # 葡萄牙
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f ro mosdns_config/geoip.dat  # 罗马尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f ru mosdns_config/geoip.dat  # 俄罗斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f sm mosdns_config/geoip.dat  # 圣马力诺
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f rs mosdns_config/geoip.dat  # 塞尔维亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f sk mosdns_config/geoip.dat  # 斯洛伐克
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f si mosdns_config/geoip.dat  # 斯洛文尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f es mosdns_config/geoip.dat  # 西班牙
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f se mosdns_config/geoip.dat  # 瑞典
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f ch mosdns_config/geoip.dat  # 瑞士
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f ua mosdns_config/geoip.dat  # 乌克兰
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f gb mosdns_config/geoip.dat  # 英国
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f va mosdns_config/geoip.dat  # 梵蒂冈
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f ax mosdns_config/geoip.dat  # 奥兰群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f fo mosdns_config/geoip.dat  # 法罗群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip/europe -f sj mosdns_config/geoip.dat  # 斯瓦尔巴和扬马延

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


./v2dat unpack geosite  -o mosdns_config/mosdns_site -f cn mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f geolocation-cn mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f geolocation-!cn mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f category-games@cn mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f category-games mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f category-game-accelerator-cn mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f category-ads-all mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f apple-cn mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f tld-cn mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f icloud mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f github mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f docker mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f youtube mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f google mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f openai mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f jetbrains mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f jetbrains-ai mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f telegram mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f whatsapp mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f meta mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f twitter mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f instagram mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f cloudflare mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f cloudfront mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f facebook mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f fastly mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f netflix mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f linkedin mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f ea mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f ubisoft mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f rockstar mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f epicgames mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f nintendo mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f playstation mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f xbox mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f steam mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f akamai mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f steamunlocked mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f gfw mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f gravatar mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f microsoft mosdns_config/geosite.dat
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

./v2dat unpack geosite  -o mosdns_config/mosdns_site -f category-ai-!cn mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f category-ai-cn mosdns_config/geosite.dat

./v2dat unpack geosite  -o mosdns_config/mosdns_site -f mega mosdns_config/geosite.dat

./v2dat unpack geosite  -o mosdns_config/mosdns_site -f dmm mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f abema mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f tver mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f japonx mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f niconico mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f line mosdns_config/geosite.dat

mv mosdns_config/mosdns_site/cn.txt mosdns_config/mosdns_site/cn_site.txt
mv mosdns_config/mosdns_ip/asia/cn.txt mosdns_config/mosdns_ip/cn_ip.txt
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

rm mosdns_config/geosite.dat
rm mosdns_config/geoip.dat
zip -r mosdns_rule.zip mosdns_config/

cd mosdns_config
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat
cd ..

cp mosdns_rule.zip mosdns_config/
