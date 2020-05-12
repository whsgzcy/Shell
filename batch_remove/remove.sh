#! /bin/sh
IP=$1
#T_PATH=/data/data/com.tencent.tmgp.sgame/shared_prefs/msdk.xml
T_PATH=/sdcard/DCIM/migu.txt

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
   echo "IP:$IP down." >> remove_down.out 
   exit 2;
fi

#首先设备此文件的路径是否存在 然后再删除
ssh $HOSTCHECK $IP "[ -f ${T_PATH} ]" >/dev/null 2>&1
if [ $? -ne 1 ]
then
   # echo has existed
   # exit 1
  ssh $HOSTCHECK $IP "rm -rf ${T_PATH}">> removed_success.out
else
    echo no path
    echo "IP:$IP no path." >> removed_no_path.out
    exit 2
fi


exit 0
