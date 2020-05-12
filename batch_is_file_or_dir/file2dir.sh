#! /bin/sh
IP=$1

if [ "$IP" == "" ]; then
    echo "ip empty."
    exit 1;
fi;

RESULT_SUCCESS="Operation successfully"
RESULT_FAILED="Operation failed"

APK_ANDROID_PATH=/sdcard/apprtc

CERT_PATH=~/id_rsa

#T_PATH=/data/data/com.tencent.tmgp.sgame/shared_prefs/msdk.xml

T_PATH=/sdcard/DCIM/migu

BOOTCLASSPATH=/system/framework/core.jar:/system/framework/conscrypt.jar:/system/framework/okhttp.jar:/system/framework/core-junit.jar:/system/framework/bouncycastle.jar:/system/framework/ext.jar:/system/framework/framework.jar:/system/framework/framework2.jar:/system/framework/telephony-common.jar:/system/framework/voip-common.jar:/system/framework/mms-common.jar:/system/framework/android.policy.jar:/system/framework/services.jar:/system/framework/apache-xml.jar:/system/framework/webviewchromium.jar:/system/framework/userExperienceService.jar

HOSTCHECK="-i $CERT_PATH -o PasswordAuthentication=no -o StrictHostKeyChecking=no -o ConnectTimeout=2"

#linux
ping -c  1 -W 1 $IP > /dev/null 2>/dev/null
#windows 
#ping -n 1 -w 1000 $IP > /dev/null 2>/dev/null
if [ "0" -ne "$?" ]; then
   echo "IP:$IP down."
   echo $IP >> down.log 
   exit 2;
fi

ssh $HOSTCHECK $IP "[ -d ${T_PATH} ]" >/dev/null 2>&1
if [ $? -ne 1 ]
then
   # echo has existed
    exit 1
else
   # echo no path

   ssh $HOSTCHECK $IP "rm -rf ${T_PATH};mkdir -p ${T_PATH};chmod -R 777 ${T_PATH}" 
   echo $IP is file >> isfiles.log
    exit 2
fi



exit 0
