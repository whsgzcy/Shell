IP=$1

if [ "$IP" == "" ]; then
    echo "ip empty."
    exit 1;
fi;

CERT_PATH=~/id_rsa

BOOTCLASSPATH=/system/framework/core.jar:/system/framework/conscrypt.jar:/system/framework/okhttp.jar:/system/framework/core-junit.jar:/system/framework/bouncycastle.jar:/system/framework/ext.jar:/system/framework/framework.jar:/system/framework/framework2.jar:/system/framework/telephony-common.jar:/system/framework/voip-common.jar:/system/framework/mms-common.jar:/system/framework/android.policy.jar:/system/framework/services.jar:/system/framework/apache-xml.jar:/system/framework/webviewchromium.jar:/system/framework/userExperienceService.jar

HOSTCHECK="-i $CERT_PATH -o PasswordAuthentication=no -o StrictHostKeyChecking=no -o ConnectTimeout=2 -o ServerAliveInterval=3"

#磁盘大小
#电量
#cpu
#域名解析
#cpu mem 使用率
#cpu 温度
#nfs检测
#是否通外网

FILE_SUFF=$(date "+%Y-%m-%d")
OUT_FILE_NAME=${FILE_SUFF}-log.out

REAML_NAME=www.baidu.com

BAIDU=www.baidu.com

MOUNT_PATH=/data/nfs/system_apk

change_line(){
echo  ""  >> ${OUT_FILE_NAME}
}

ping -c  1 -W 1 $IP > /dev/null 2>/dev/null
if [ "0" -ne "$?" ]; then
   echo "IP:$IP down."
   echo "IP:$IP down." >>${FILE_SUFF}-chat_down.out
   exit 2;
fi

#rm -rf *.out

echo "--->*${IP}* will start check" >> ${OUT_FILE_NAME}

change_line

echo "#check_df: 100 session" >> ${OUT_FILE_NAME}

ssh $HOSTCHECK $IP "export BOOTCLASSPATH=$BOOTCLASSPATH; df | grep /system | head -1" >> ${OUT_FILE_NAME}

change_line

echo "#over_df:100 session" >> ${OUT_FILE_NAME}

change_line

echo "#check_df: 101 session" >> ${OUT_FILE_NAME}

ssh $HOSTCHECK $IP " df | grep /dev | head -1" >> ${OUT_FILE_NAME}

change_line

echo "#over_df:101 session" >> ${OUT_FILE_NAME}

change_line

echo "#check_df: 102 session" >> ${OUT_FILE_NAME}

ssh $HOSTCHECK $IP " df | grep /dev/graphics/fb0 | head -1" >> ${OUT_FILE_NAME}

change_line

echo "#over_df:102 session" >> ${OUT_FILE_NAME}

change_line

echo "#check_df: 103 session" >> ${OUT_FILE_NAME}

ssh $HOSTCHECK $IP " df | grep /data | head -1" >> ${OUT_FILE_NAME}

change_line

echo "#over_df:103 session" >> ${OUT_FILE_NAME}

change_line

echo "#check_df: 104 session" >> ${OUT_FILE_NAME}

ssh $HOSTCHECK $IP " df | grep / | head -1" >> ${OUT_FILE_NAME}

change_line

echo "#over_df:104 session" >> ${OUT_FILE_NAME}

change_line

echo "#check_df: 105 session" >> ${OUT_FILE_NAME}

ssh $HOSTCHECK $IP " df | grep /sys/fs/cgroup | head -1" >> ${OUT_FILE_NAME}

change_line

echo "#over_df:105 session" >> ${OUT_FILE_NAME}

change_line

echo "#check_df: 106 session" >> ${OUT_FILE_NAME}

ssh $HOSTCHECK $IP " df | grep /mnt | head -1" >> ${OUT_FILE_NAME}

change_line

echo "#over_df:106 session" >> ${OUT_FILE_NAME}

change_line

echo "#check_df: 107 session" >> ${OUT_FILE_NAME}

ssh $HOSTCHECK $IP " df | grep /subin | head -1" >> ${OUT_FILE_NAME}

change_line

echo "#over_df:107 session" >> ${OUT_FILE_NAME}

change_line

echo "#check_df: 108 session" >> ${OUT_FILE_NAME}

ssh $HOSTCHECK $IP " df | grep /storage | head -1" >> ${OUT_FILE_NAME}

change_line

echo "#over_df:108 session" >> ${OUT_FILE_NAME}

change_line

echo "#check_df: 109 session" >> ${OUT_FILE_NAME}

ssh $HOSTCHECK $IP " df | grep /mnt/runtime/default/emulated | head -1" >> ${OUT_FILE_NAME}

change_line

echo "#over_df:109 session" >> ${OUT_FILE_NAME}

change_line

echo "#check_df: 110 session" >> ${OUT_FILE_NAME}

ssh $HOSTCHECK $IP " df | grep /storage/emulated | head -1" >> ${OUT_FILE_NAME}

change_line

echo "#over_df:110 session" >> ${OUT_FILE_NAME}

change_line

echo "#check_df: 111 session" >> ${OUT_FILE_NAME}

ssh $HOSTCHECK $IP " df | grep /mnt/runtime/read/emulated | head -1" >> ${OUT_FILE_NAME}

change_line

echo "#over_df:111 session" >> ${OUT_FILE_NAME}

change_line

echo "#check_df: 112 session" >> ${OUT_FILE_NAME}

ssh $HOSTCHECK $IP " df | grep /mnt/runtime/write/emulated | head -1" >> ${OUT_FILE_NAME}

change_line

echo "#over_df:112 session" >> ${OUT_FILE_NAME}

change_line

echo "#check_df: 113 session" >> ${OUT_FILE_NAME}

ssh $HOSTCHECK $IP " df | grep /data/nfs | head -1" >> ${OUT_FILE_NAME}

change_line

echo "#over_df:113 session" >> ${OUT_FILE_NAME}

change_line

echo "#check_battery: 2 session" >> ${OUT_FILE_NAME}

ssh $HOSTCHECK $IP " dumpsys battery" >> ${OUT_FILE_NAME}

change_line

echo "#over_battery:2 session" >> ${OUT_FILE_NAME}

change_line

echo "#check_cpu: 3 session" >> ${OUT_FILE_NAME}

ssh $HOSTCHECK $IP "echo -n "attribute:";cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq" >> ${OUT_FILE_NAME}
ssh $HOSTCHECK $IP "echo -n "temperatue:";cat /sys/class/thermal/thermal_zone0/temp" >> ${OUT_FILE_NAME}

change_line

echo "#over_cpu:3 session" >> ${OUT_FILE_NAME}

change_line

echo "#check_internet: 4 session" >> ${OUT_FILE_NAME}

ssh $HOSTCHECK $IP "ping -c  1 -W 1 ${REAML_NAME}" > /dev/null 2>/dev/null
if [ "0" -ne "$?" ]; then
   echo "realm_name:no" >> ${OUT_FILE_NAME}
   else
   echo "realm_name:yes" >> ${OUT_FILE_NAME}
fi

ssh $HOSTCHECK $IP "ping -c  1 -W 1 ${BAIDU}" > /dev/null 2>/dev/null
if [ "0" -ne "$?" ]; then
   echo "online:no" >> ${OUT_FILE_NAME}
   else
   echo "online:yes" >> ${OUT_FILE_NAME}
fi

change_line

echo "#over_internet:4 session" >> ${OUT_FILE_NAME}

change_line

echo "#check_cpu_mem: 5 session" >> ${OUT_FILE_NAME}

ssh $HOSTCHECK $IP "top -bn1" >> ${OUT_FILE_NAME}

change_line

echo "#over_cpu_mem:5 session" >> ${OUT_FILE_NAME}

change_line

echo "#check_nfs: 6 session" >> ${OUT_FILE_NAME}

ssh $HOSTCHECK $IP "[ -d ${MOUNT_PATH} ]" >/dev/null 2>&1
if [ $? -ne 1 ]
then
   echo "yes" >> ${OUT_FILE_NAME}
else
   echo "no" >> ${OUT_FILE_NAME}
fi

change_line

echo "#over_nfs:6 session" >> ${OUT_FILE_NAME}

change_line

exit 0
