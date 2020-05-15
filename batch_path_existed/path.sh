#! /bin/sh
IP=$1
T_PATH=/data/nfs/system_apk

if [ "$IP" == "" ]; then
    echo "ip empty."
    exit 1;
fi;

if [ "$T_PATH" == "" ]; then
    echo "file name empty."
    exit 1;
fi;

CERT_PATH=~/id_rsa

BOOTCLASSPATH=/system/framework/core.jar:/system/framework/conscrypt.jar:/system/framework/okhttp.jar:/system/framework/core-junit.jar:/system/framework/bouncycastle.jar:/system/framework/ext.jar:/system/framework/framework.jar:/system/framework/framework2.jar:/system/framework/telephony-common.jar:/system/framework/voip-common.jar:/system/framework/mms-common.jar:/system/framework/android.policy.jar:/system/framework/services.jar:/system/framework/apache-xml.jar:/system/framework/webviewchromium.jar:/system/framework/userExperienceService.jar

HOSTCHECK="-i $CERT_PATH -o PasswordAuthentication=no -o StrictHostKeyChecking=no -o ConnectTimeout=2"

#linux
ping -c  1 -W 1 $IP > /dev/null 2>/dev/null
#windows 
#ping -n 1 -w 1000 $IP > /dev/null 2>/dev/null
if [ "0" -ne "$?" ]; then
   echo "IP:$IP down."
   echo "IP:$IP down." >> ip_down.out 
   exit 2;
fi

#首先设备此文件的路径是否存在 然后再删除
#-d 文件夹路径 -f 文件路径
ssh $HOSTCHECK $IP "[ -d ${T_PATH} ]" >/dev/null 2>&1
if [ $? -ne 1 ]
then
   # echo has existed
   # exit 1
   # ssh $HOSTCHECK $IP "rm -rf ${T_PATH}">> removed_success.out
   # result=`ssh $HOSTCHECK $IP 'settings get system miguStreamUrl'`
    result=`ssh $HOSTCHECK $IP "mount | grep /data/nfs"`
   #echo $result
    echo "existed=$IP" >> path.out
    echo $result >> path.out
else
    # echo no path
    # echo "IP:$IP no path." >> removed_no_path.out
    # exit 2
    echo no path $IP
    echo "no=$IP" >> path_no.out
fi


exit 0
