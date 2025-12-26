echo 'make some safety net'
touch /config/scripts/token.txt

echo 'be sure all is clean before fetching!'
rm /config/scripts/token.txt

echo 'getting our nice token'
json=$( curl 'https://api.hypon.cloud/v2/login' \
  -H 'accept: application/json' \
  -H 'accept-language: en-GB,en;q=0.9,fr-BE;q=0.8,fr;q=0.7,en-US;q=0.6' \
  -H 'content-type: application/json;charset=UTF-8' \
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
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36' \
  --data-raw '{"username":"[toReplace]","password":"[toReplace]","oem":null}')

echo 'clean it up'
token=$(echo $json | sed "s/{.*\"token\":\"\([^\"]*\).*}/\1/g")
echo $token > /config/scripts/token.txt
echo $token