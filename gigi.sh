#!/bin/bash

date_end=$(date +%s)
date_start=$(($date_end - 300))
echo $date_end
echo $date_start
token=$(curl -X POST https://vrmapi.victronenergy.com/v2/auth/login -H 'Content-Type: application/json' -d '{"username":"mat.brionne@gmail.com","password":"greenpanel2021"}')
echo $token > o.json
tok=$(jq -r .[] o.json | head -1)
echo $tok
#tok=$(echo $tk | tr -d \")

id_user=$(jq .[] o.json | sed -n 2p)
echo $id_user 
id=$(curl -X GET -H "X-Authorization: Bearer $tok" "https://vrmapi.victronenergy.com/v2/users/$id_user/installations")
echo $id > p.json

id_site=$(cat p.json  | jq '.records[] | {idSite}' | sed -n 2p | awk 'NF>1{print $NF}')
echo $id_site

csv=$(curl -X GET -H "X-Authorization: Bearer $tok" "https://vrmapi.victronenergy.com/v2/installations/$id_site/data-download?start=$date_start&end=$date_end&format=csv")

#csv=$(curl -X GET -H "X-Authorization: Bearer $tok" "https://vrmapi.victronenergy.com/v2/installations/$id_site/data-download?start=1641859204&end=1641860344&format=csv")

#id=$(curl -X GET -H "X-Authorization: Bearer $tok" "https://vrmapi.victronenerfy.com/v2/users/"${id_user}"/installations")

#echo $id
#id=$(curl -X GET -H "X-Authorization: Bearer $tok" "https://vrmapi.victronenerfy.com/v2/users/166098/installations")
#echo $id
#echo $tok
#csv=$(curl -X GET -H "X-Authorization: Bearer $tok" "https://vrmapi.victronenergy.com/v2/installations/130098/data-download?start=1641859204&end=1641860344&format=csv")

echo $csv > rezult.csv
