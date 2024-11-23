mkdir mosdns_config
cd mosdns_config
mkdir mosdns_ip
mkdir mosdns_site
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat
cd ..
ls -a

./v2dat unpack geoip -o mosdns_config/mosdns_ip -f us mosdns_config/geoip.dat
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ca mosdns_config/geoip.dat
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f jp mosdns_config/geoip.dat
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f hk mosdns_config/geoip.dat
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f sg mosdns_config/geoip.dat
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f cn mosdns_config/geoip.dat
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f uk mosdns_config/geoip.dat

./v2dat unpack geosite  -o mosdns_config/mosdns_site -f cn mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f category-games@cn mosdns_config/geosite.dat
