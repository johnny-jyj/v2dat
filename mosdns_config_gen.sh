mkdir mosdns_config
cd mosdns_config
mkdir mosdns_ip
mkdir mosdns_site
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat
cd ..

github.com/urlesistiana/v2dat/v2data unpack mosdns_config/geoip -o mosdns_config/mosdns_ip -f us geoip.dat
github.com/urlesistiana/v2dat/v2data unpack mosdns_config/geoip -o mosdns_config/mosdns_ip -f ca geoip.dat
github.com/urlesistiana/v2dat/v2data unpack mosdns_config/geoip -o mosdns_config/mosdns_ip -f jp geoip.dat
github.com/urlesistiana/v2dat/v2data unpack mosdns_config/geoip -o mosdns_config/mosdns_ip -f hk geoip.dat
github.com/urlesistiana/v2dat/v2data unpack mosdns_config/geoip -o mosdns_config/mosdns_ip -f sg geoip.dat
github.com/urlesistiana/v2dat/v2data unpack mosdns_config/geoip -o mosdns_config/mosdns_ip -f cn geoip.dat
github.com/urlesistiana/v2dat/v2data unpack mosdns_config/geoip -o mosdns_config/mosdns_ip -f uk geoip.dat

github.com/urlesistiana/v2dat/v2data unpack mosdns_config/geosite  -o mosdns_config/mosdns_site -f cn geosite.dat
github.com/urlesistiana/v2dat/v2data unpack mosdns_config/geosite  -o mosdns_config/mosdns_site -f category-games@cn geosite.dat
