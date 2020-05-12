#!/bin/bash

#磁盘大小
#电量
#cpu
#internet
#cpu mem 使用率
#nfs检测

echo "ANDROID DEVICE CHECK FOR MIGU"

sleep 1

echo "CHECKS:"

sleep 1

echo "#磁盘大小
#电量
#cpu
#internet
#cpu mem 使用率
#nfs检测

sleep 1

echo "LISTS:"

sleep 1
echo "#check_df: 1 session  #磁盘大小"

sleep 1
echo "#check_battery: 2 session  #电量"

sleep 1
echo "#check_cpu: 3 session  #cpu"

sleep 1
echo "#check_realm_name: 4 session  #internet"

sleep 1
echo "#check_cpu_mem: 5 session  #cpu mem 使用率"

sleep 1
echo "#check_nfs: 7 session  #nfs检测"

sleep 1
echo "License"
sleep 1
echo "Copyright (C) 2019 MIGU"
echo "Licensed under the MIGU License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at"
echo ""
echo "http://www.migu.org/licenses/LICENSE-2.0"
echo ""
echo "Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License."

rm -rf *.out

for IP in `cat ip.txt`
do
        echo "bash chat_old.sh ${IP}"
	echo `bash chat_old.sh ${IP}`
done;
