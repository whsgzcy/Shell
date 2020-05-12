#!/bin/bash
FILE_PATH=/data/nfs/system_apk/sh/batch_uninstall_tools/
PACKAGE_NAME=$1

if [ $# != 1 ] ; then
        echo "USAGE: $0 package_name"
        exit 1;
fi


if [ "$PACKAGE_NAME" == "" ]; then
    echo "package name empty."
    exit 1;
fi;

rm -rf *.out

# 并发数,同时开启进程的数量
Qp=10
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

for IP in `cat ip.txt`
do
	{
        #`bash updates_business-conf.sh ${IP} ${FILE_PATH} ${FILE_NAME}>> $FILE_LOG`
	echo     "bash ${FILE_PATH}app_uninstall.sh ${IP} ${PACKAGE_NAME}"
        echo `bash app_uninstall.sh ${IP} ${PACKAGE_NAME}`
	echo $IP
	sleep 5;
	} &

	 push $!
        while [[ $run -ge $Qp ]]; 
        do
            check
            sleep 5
        done
done;
