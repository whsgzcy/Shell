#!/bin/bash

FILE_PATH=$(pwd)

cd ${FILE_PATH}

# 并发数,同时开启进程的数量
Qp=80
# 存放进程的队列
Qarr=();
# 运行进程数
run=0
# 将进程的添加到队列里的函数
function push() {
        Qarr=(${Qarr[@]} $1)
        run=${#Qarr[@]}
}
# 检测队列里的进程是否运行完毕
function check() {
        oldQ=(${Qarr[@]})
        Qarr=()
        for p in "${oldQ[@]}";do
                if [[ -d "/proc/$p" ]];then
                        Qarr=(${Qarr[@]} $p)
                fi
        done
        run=${#Qarr[@]}
}

shuf ip_p.txt -n 5 -o $(date "+%Y-%m-%d")-restart-devices.txt

for IP in `cat $(date "+%Y-%m-%d")-restart-devices.txt`
do
	{
        #`bash updates_business-conf.sh ${IP} ${FILE_PATH} ${FILE_NAME}>> $FILE_LOG`
	echo  "bash ${FILE_PATH} reboot.sh ${IP}"
        echo `bash reboot.sh ${IP} `
	sleep 1;
	} &

	 push $!
        while [[ $run -ge $Qp ]]; 
        do
            check
            sleep 20
        done
done;
