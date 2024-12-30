mkdir mosdns_config
cd mosdns_config
mkdir mosdns_ip
mkdir mosdns_site
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat
cd ..

./v2dat unpack geoip -o mosdns_config/mosdns_ip -f us mosdns_config/geoip.dat
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f ca mosdns_config/geoip.dat
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f jp mosdns_config/geoip.dat
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f hk mosdns_config/geoip.dat
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f sg mosdns_config/geoip.dat
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f cn mosdns_config/geoip.dat
./v2dat unpack geoip -o mosdns_config/mosdns_ip -f uk mosdns_config/geoip.dat
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
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f category-games@cn mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f category-games mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f apple-cn mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f icloud mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f github mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f google mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f openai mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f jetbrains mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f jetbrains-ai mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f telegram mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f cloudflare mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f cloudfront mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f facebook mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f fastly mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f netflix mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f twitter mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f gfw mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f alibaba mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f alibabacloud mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f aliyun mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f ali213 mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f alibaba-ads mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f tencent mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f tencent-ads mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f tencent-dev mosdns_config/geosite.dat
./v2dat unpack geosite  -o mosdns_config/mosdns_site -f tencent-games mosdns_config/geosite.dat
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


mv mosdns_config/mosdns_site/cn.txt mosdns_config/mosdns_site/cn_site.txt
mv mosdns_config/mosdns_ip/cn.txt mosdns_config/mosdns_ip/cn_ip.txt
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
