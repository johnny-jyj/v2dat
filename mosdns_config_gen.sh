mkdir mosdns_config
cd mosdns_config
mkdir mosdns_ip
mkdir mosdns_site
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat
cd ..

# ============================================================
# 亚洲 (Asia)
# ============================================================
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f af mosdns_config/geoip.dat  # 阿富汗
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f am mosdns_config/geoip.dat  # 亚美尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f az mosdns_config/geoip.dat  # 阿塞拜疆
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f bh mosdns_config/geoip.dat  # 巴林
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f bd mosdns_config/geoip.dat  # 孟加拉国
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f bt mosdns_config/geoip.dat  # 不丹
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f bn mosdns_config/geoip.dat  # 文莱
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f kh mosdns_config/geoip.dat  # 柬埔寨
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f cn mosdns_config/geoip.dat  # 中国
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f cy mosdns_config/geoip.dat  # 塞浦路斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ge mosdns_config/geoip.dat  # 格鲁吉亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f hk mosdns_config/geoip.dat  # 香港
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f in mosdns_config/geoip.dat  # 印度
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f id mosdns_config/geoip.dat  # 印度尼西亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ir mosdns_config/geoip.dat  # 伊朗
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f iq mosdns_config/geoip.dat  # 伊拉克
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f il mosdns_config/geoip.dat  # 以色列
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f jp mosdns_config/geoip.dat  # 日本
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f jo mosdns_config/geoip.dat  # 约旦
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f kz mosdns_config/geoip.dat  # 哈萨克斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f kw mosdns_config/geoip.dat  # 科威特
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f kg mosdns_config/geoip.dat  # 吉尔吉斯斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f la mosdns_config/geoip.dat  # 老挝
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f lb mosdns_config/geoip.dat  # 黎巴嫩
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f mo mosdns_config/geoip.dat  # 澳门
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f my mosdns_config/geoip.dat  # 马来西亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f mv mosdns_config/geoip.dat  # 马尔代夫
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f mn mosdns_config/geoip.dat  # 蒙古
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f mm mosdns_config/geoip.dat  # 缅甸
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f np mosdns_config/geoip.dat  # 尼泊尔
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f kp mosdns_config/geoip.dat  # 朝鲜
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f om mosdns_config/geoip.dat  # 阿曼
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f pk mosdns_config/geoip.dat  # 巴基斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ps mosdns_config/geoip.dat  # 巴勒斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ph mosdns_config/geoip.dat  # 菲律宾
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f qa mosdns_config/geoip.dat  # 卡塔尔
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f sa mosdns_config/geoip.dat  # 沙特阿拉伯
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f sg mosdns_config/geoip.dat  # 新加坡
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f kr mosdns_config/geoip.dat  # 韩国
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f lk mosdns_config/geoip.dat  # 斯里兰卡
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f sy mosdns_config/geoip.dat  # 叙利亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f tw mosdns_config/geoip.dat  # 台湾
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f tj mosdns_config/geoip.dat  # 塔吉克斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f th mosdns_config/geoip.dat  # 泰国
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f tl mosdns_config/geoip.dat  # 东帝汶
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f tr mosdns_config/geoip.dat  # 土耳其
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f tm mosdns_config/geoip.dat  # 土库曼斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ae mosdns_config/geoip.dat  # 阿联酋
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f uz mosdns_config/geoip.dat  # 乌兹别克斯坦
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f vn mosdns_config/geoip.dat  # 越南
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ye mosdns_config/geoip.dat  # 也门
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f cc mosdns_config/geoip.dat  # 科科斯（基林）群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f cx mosdns_config/geoip.dat  # 圣诞岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f io mosdns_config/geoip.dat  # 英属印度洋领地

# ============================================================
# 欧洲 (Europe)
# ============================================================
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f al mosdns_config/geoip.dat  # 阿尔巴尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ad mosdns_config/geoip.dat  # 安道尔
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f at mosdns_config/geoip.dat  # 奥地利
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f by mosdns_config/geoip.dat  # 白俄罗斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f be mosdns_config/geoip.dat  # 比利时
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ba mosdns_config/geoip.dat  # 波黑
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f bg mosdns_config/geoip.dat  # 保加利亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f hr mosdns_config/geoip.dat  # 克罗地亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f cz mosdns_config/geoip.dat  # 捷克
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f dk mosdns_config/geoip.dat  # 丹麦
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ee mosdns_config/geoip.dat  # 爱沙尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f fi mosdns_config/geoip.dat  # 芬兰
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f fr mosdns_config/geoip.dat  # 法国
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f de mosdns_config/geoip.dat  # 德国
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f gi mosdns_config/geoip.dat  # 直布罗陀
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f gr mosdns_config/geoip.dat  # 希腊
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f gg mosdns_config/geoip.dat  # 根西岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f hu mosdns_config/geoip.dat  # 匈牙利
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f is mosdns_config/geoip.dat  # 冰岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ie mosdns_config/geoip.dat  # 爱尔兰
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f im mosdns_config/geoip.dat  # 马恩岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f it mosdns_config/geoip.dat  # 意大利
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f je mosdns_config/geoip.dat  # 泽西岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f xk mosdns_config/geoip.dat  # 科索沃
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f lv mosdns_config/geoip.dat  # 拉脱维亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f li mosdns_config/geoip.dat  # 列支敦士登
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f lt mosdns_config/geoip.dat  # 立陶宛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f lu mosdns_config/geoip.dat  # 卢森堡
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f mt mosdns_config/geoip.dat  # 马耳他
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f md mosdns_config/geoip.dat  # 摩尔多瓦
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f mc mosdns_config/geoip.dat  # 摩纳哥
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f me mosdns_config/geoip.dat  # 黑山
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f nl mosdns_config/geoip.dat  # 荷兰
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f mk mosdns_config/geoip.dat  # 北马其顿
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f no mosdns_config/geoip.dat  # 挪威
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f pl mosdns_config/geoip.dat  # 波兰
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f pt mosdns_config/geoip.dat  # 葡萄牙
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ro mosdns_config/geoip.dat  # 罗马尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ru mosdns_config/geoip.dat  # 俄罗斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f sm mosdns_config/geoip.dat  # 圣马力诺
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f rs mosdns_config/geoip.dat  # 塞尔维亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f sk mosdns_config/geoip.dat  # 斯洛伐克
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f si mosdns_config/geoip.dat  # 斯洛文尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f es mosdns_config/geoip.dat  # 西班牙
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f se mosdns_config/geoip.dat  # 瑞典
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ch mosdns_config/geoip.dat  # 瑞士
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ua mosdns_config/geoip.dat  # 乌克兰
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f gb mosdns_config/geoip.dat  # 英国
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f va mosdns_config/geoip.dat  # 梵蒂冈
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ax mosdns_config/geoip.dat  # 奥兰群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f fo mosdns_config/geoip.dat  # 法罗群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f sj mosdns_config/geoip.dat  # 斯瓦尔巴和扬马延

# ============================================================
# 北美洲 (North America)
# ============================================================
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ag mosdns_config/geoip.dat  # 安提瓜和巴布达
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f bs mosdns_config/geoip.dat  # 巴哈马
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f bb mosdns_config/geoip.dat  # 巴巴多斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f bz mosdns_config/geoip.dat  # 伯利兹
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f bm mosdns_config/geoip.dat  # 百慕大
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f vg mosdns_config/geoip.dat  # 英属维尔京群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ca mosdns_config/geoip.dat  # 加拿大
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ky mosdns_config/geoip.dat  # 开曼群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f cr mosdns_config/geoip.dat  # 哥斯达黎加
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f cu mosdns_config/geoip.dat  # 古巴
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f cw mosdns_config/geoip.dat  # 库拉索
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f dm mosdns_config/geoip.dat  # 多米尼克
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f do mosdns_config/geoip.dat  # 多米尼加共和国
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f sv mosdns_config/geoip.dat  # 萨尔瓦多
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f gl mosdns_config/geoip.dat  # 格陵兰
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f gd mosdns_config/geoip.dat  # 格林纳达
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f gp mosdns_config/geoip.dat  # 瓜德罗普
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f gt mosdns_config/geoip.dat  # 危地马拉
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ht mosdns_config/geoip.dat  # 海地
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f hn mosdns_config/geoip.dat  # 洪都拉斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f jm mosdns_config/geoip.dat  # 牙买加
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f mq mosdns_config/geoip.dat  # 马提尼克
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f mx mosdns_config/geoip.dat  # 墨西哥
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ni mosdns_config/geoip.dat  # 尼加拉瓜
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f pa mosdns_config/geoip.dat  # 巴拿马
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f pr mosdns_config/geoip.dat  # 波多黎各
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f kn mosdns_config/geoip.dat  # 圣基茨和尼维斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f lc mosdns_config/geoip.dat  # 圣卢西亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f vc mosdns_config/geoip.dat  # 圣文森特和格林纳丁斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f sx mosdns_config/geoip.dat  # 荷属圣马丁
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f tt mosdns_config/geoip.dat  # 特立尼达和多巴哥
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f tc mosdns_config/geoip.dat  # 特克斯和凯科斯群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f us mosdns_config/geoip.dat  # 美国
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f vi mosdns_config/geoip.dat  # 美属维尔京群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f aw mosdns_config/geoip.dat  # 阿鲁巴
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ai mosdns_config/geoip.dat  # 安圭拉
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ms mosdns_config/geoip.dat  # 蒙特塞拉特
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f bq mosdns_config/geoip.dat  # 荷兰加勒比区
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f bl mosdns_config/geoip.dat  # 圣巴泰勒米
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f mf mosdns_config/geoip.dat  # 法属圣马丁
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f pm mosdns_config/geoip.dat  # 圣皮埃尔和密克隆

# ============================================================
# 南美洲 (South America)
# ============================================================
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ar mosdns_config/geoip.dat  # 阿根廷
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f bo mosdns_config/geoip.dat  # 玻利维亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f br mosdns_config/geoip.dat  # 巴西
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f cl mosdns_config/geoip.dat  # 智利
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f co mosdns_config/geoip.dat  # 哥伦比亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ec mosdns_config/geoip.dat  # 厄瓜多尔
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f fk mosdns_config/geoip.dat  # 福克兰群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f gf mosdns_config/geoip.dat  # 法属圭亚那
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f gy mosdns_config/geoip.dat  # 圭亚那
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f py mosdns_config/geoip.dat  # 巴拉圭
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f pe mosdns_config/geoip.dat  # 秘鲁
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f sr mosdns_config/geoip.dat  # 苏里南
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f uy mosdns_config/geoip.dat  # 乌拉圭
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ve mosdns_config/geoip.dat  # 委内瑞拉

# ============================================================
# 非洲 (Africa)
# ============================================================
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f dz mosdns_config/geoip.dat  # 阿尔及利亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ao mosdns_config/geoip.dat  # 安哥拉
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f bj mosdns_config/geoip.dat  # 贝宁
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f bw mosdns_config/geoip.dat  # 博茨瓦纳
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f bf mosdns_config/geoip.dat  # 布基纳法索
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f bi mosdns_config/geoip.dat  # 布隆迪
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f cv mosdns_config/geoip.dat  # 佛得角
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f cm mosdns_config/geoip.dat  # 喀麦隆
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f cf mosdns_config/geoip.dat  # 中非共和国
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f td mosdns_config/geoip.dat  # 乍得
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f km mosdns_config/geoip.dat  # 科摩罗
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f cg mosdns_config/geoip.dat  # 刚果（布）{刚果共和国}
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f cd mosdns_config/geoip.dat  # 刚果（金）{刚果民主共和国}
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ci mosdns_config/geoip.dat  # 科特迪瓦
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f dj mosdns_config/geoip.dat  # 吉布提
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f eg mosdns_config/geoip.dat  # 埃及
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f gq mosdns_config/geoip.dat  # 赤道几内亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f er mosdns_config/geoip.dat  # 厄立特里亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f sz mosdns_config/geoip.dat  # 埃斯瓦蒂尼
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f et mosdns_config/geoip.dat  # 埃塞俄比亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ga mosdns_config/geoip.dat  # 加蓬
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f gm mosdns_config/geoip.dat  # 冈比亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f gh mosdns_config/geoip.dat  # 加纳
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f gn mosdns_config/geoip.dat  # 几内亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f gw mosdns_config/geoip.dat  # 几内亚比绍
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ke mosdns_config/geoip.dat  # 肯尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ls mosdns_config/geoip.dat  # 莱索托
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f lr mosdns_config/geoip.dat  # 利比里亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ly mosdns_config/geoip.dat  # 利比亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f mg mosdns_config/geoip.dat  # 马达加斯加
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f mw mosdns_config/geoip.dat  # 马拉维
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ml mosdns_config/geoip.dat  # 马里
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f mr mosdns_config/geoip.dat  # 毛里塔尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f mu mosdns_config/geoip.dat  # 毛里求斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f yt mosdns_config/geoip.dat  # 马约特
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ma mosdns_config/geoip.dat  # 摩洛哥
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f mz mosdns_config/geoip.dat  # 莫桑比克
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f na mosdns_config/geoip.dat  # 纳米比亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ne mosdns_config/geoip.dat  # 尼日尔
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ng mosdns_config/geoip.dat  # 尼日利亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f re mosdns_config/geoip.dat  # 留尼汪
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f rw mosdns_config/geoip.dat  # 卢旺达
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f st mosdns_config/geoip.dat  # 圣多美和普林西比
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f sn mosdns_config/geoip.dat  # 塞内加尔
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f sc mosdns_config/geoip.dat  # 塞舌尔
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f sl mosdns_config/geoip.dat  # 塞拉利昂
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f so mosdns_config/geoip.dat  # 索马里
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f za mosdns_config/geoip.dat  # 南非
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ss mosdns_config/geoip.dat  # 南苏丹
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f sd mosdns_config/geoip.dat  # 苏丹
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f tz mosdns_config/geoip.dat  # 坦桑尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f tg mosdns_config/geoip.dat  # 多哥
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f tn mosdns_config/geoip.dat  # 突尼斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ug mosdns_config/geoip.dat  # 乌干达
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f zm mosdns_config/geoip.dat  # 赞比亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f zw mosdns_config/geoip.dat  # 津巴布韦
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f sh mosdns_config/geoip.dat  # 圣赫勒拿

# ============================================================
# 大洋洲 (Oceania)
# ============================================================
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f au mosdns_config/geoip.dat  # 澳大利亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f fj mosdns_config/geoip.dat  # 斐济
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ki mosdns_config/geoip.dat  # 基里巴斯
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f mh mosdns_config/geoip.dat  # 马绍尔群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f fm mosdns_config/geoip.dat  # 密克罗尼西亚联邦
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f nr mosdns_config/geoip.dat  # 瑙鲁
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f nz mosdns_config/geoip.dat  # 新西兰
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f pw mosdns_config/geoip.dat  # 帕劳
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f pg mosdns_config/geoip.dat  # 巴布亚新几内亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ws mosdns_config/geoip.dat  # 萨摩亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f sb mosdns_config/geoip.dat  # 所罗门群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f to mosdns_config/geoip.dat  # 汤加
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f tv mosdns_config/geoip.dat  # 图瓦卢
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f vu mosdns_config/geoip.dat  # 瓦努阿图
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f nc mosdns_config/geoip.dat  # 新喀里多尼亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f pf mosdns_config/geoip.dat  # 法属波利尼西亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f gu mosdns_config/geoip.dat  # 关岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f as mosdns_config/geoip.dat  # 美属萨摩亚
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f mp mosdns_config/geoip.dat  # 北马里亚纳群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ck mosdns_config/geoip.dat  # 库克群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f nu mosdns_config/geoip.dat  # 纽埃
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f tk mosdns_config/geoip.dat  # 托克劳
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f wf mosdns_config/geoip.dat  # 瓦利斯和富图纳
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f nf mosdns_config/geoip.dat  # 诺福克岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f pn mosdns_config/geoip.dat  # 皮特凯恩群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f um mosdns_config/geoip.dat  # 美国本土外小岛屿

# ============================================================
# 南极洲 (Antarctica) — 科考站有网络
# ============================================================
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f aq mosdns_config/geoip.dat  # 南极洲
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f bv mosdns_config/geoip.dat  # 布韦岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f gs mosdns_config/geoip.dat  # 南乔治亚和南桑威奇群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f hm mosdns_config/geoip.dat  # 赫德岛和麦克唐纳群岛
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f tf mosdns_config/geoip.dat  # 法属南部和南极领地


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
