FILE_PATH=/data/nfs/system_apk/sh/reboot_tools

cd $FILE_PATH


shuf ip_p.txt -n 5 -o $(date "+%Y-%m-%d")-restart-devices.txt

for IP in `cat $(date "+%Y-%m-%d")-restart-devices.txt`
do
        echo  "bash ${FILE_PATH} reboot.sh ${IP} "
        echo  `bash reboot.sh ${IP}`
done;
