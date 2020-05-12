#将down中的每一行 拼接为 json数组 请求到后台

#{
#    "downs": [
#        "10.109.1.1",
#        "10.109.1.2"
#    ],
#    "udate": "2019-12-4",
#    "code": 1
#}

url=http://36.155.114.74:8000/callback/countDownAndroids

down_f_name=$(date "+%Y-%m-%d")-restart-devices.txt

if [ ! -f "$down_f_name" ]; then
    echo 'file not exist '
    curl -i -X POST -H "'Content-type':'application/json'" -d '{"code": '0'}' $url
    exit 2;
fi

ips=""
for IP in `cat $down_f_name`
do
ips="\"${IP}\",${ips}"
done;

json=`echo ${ips} | sed 's/,$//g'`
json='{"downs":'[${json}]',"update":"'$(date "+%Y-%m-%d")'","code":'1'}'

echo $json

curl --request POST \
  --url http://36.155.114.74:8000/callback/countDownAndroids \
  --header 'Content-Type: application/json' \
  --header 'Postman-Token: 56e28154-f275-44a6-aee6-d69c1d40245a' \
  --header 'cache-control: no-cache' \
  --data ${json}


#curl --request POST \
#  --url $url \
#  --header 'Content-Type: application/json' \
#  --header 'Postman-Token: 56e28154-f275-44a6-aee6-d69c1d40245a' \
#  --header 'cache-control: no-cache' \
#  --data '$json'

#curl -i -X POST -H "'Content-type':'application/json'" -d $json $url

exit 2;
