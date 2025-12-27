echo 'make some safety net'
touch /config/scripts/myStats.json

echo 'be sure all is clean before fetching!'
rm /config/scripts/myStats.json

echo 'retrieving my lovely token'
token=$( cat /config/scripts/token.txt )

stats=$(curl 'https://api.hypon.cloud/v2/plant/list2?page=1&page_size=10&refresh=true' \
  -H 'accept: application/json' \
  -H 'accept-language: en-GB,en;q=0.9,fr-BE;q=0.8,fr;q=0.7,en-US;q=0.6' \
  -H 'authorization: Bearer '$token \
  -H 'dnt: 1' \
  -H 'origin: https://www.hypon.cloud' \
  -H 'priority: u=1, i' \
  -H 'referer: https://www.hypon.cloud/' \
  -H 'sec-ch-ua: "Chromium";v="136", "Google Chrome";v="136", "Not.A/Brand";v="99"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Windows"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-site' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36')

echo $stats > /config/scripts/myStats.json
sed -i 's/{"data":\[//' /config/scripts/myStats.json
sed -i 's/[]].*$//'  /config/scripts/myStats.json

chmod 777 /config/scripts/myStats.json
