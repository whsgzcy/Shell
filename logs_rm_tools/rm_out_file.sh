#! /bin/sh
IP=$1

if [ "$IP" == "" ]; then
    echo "ip empty."
    exit 1;
fi;

RESULT_SUCCESS="Operation successfully"
RESULT_FAILED="Operation failed"

APK_ANDROID_PATH=/sdcard/migu/*.log

CERT_PATH=~/id_rsa

BOOTCLASSPATH=/system/framework/core.jar:/system/framework/conscrypt.jar:/system/framework/okhttp.jar:/system/framework/core-junit.jar:/system/framework/bouncycastle.jar:/system/framework/ext.jar:/system/framework/framework.jar:/system/framework/framework2.jar:/system/framework/telephony-common.jar:/system/framework/voip-common.jar:/system/framework/mms-common.jar:/system/framework/android.policy.jar:/system/framework/services.jar:/system/framework/apache-xml.jar:/system/framework/webviewchromium.jar:/system/framework/userExperienceService.jar

HOSTCHECK="-i $CERT_PATH -o PasswordAuthentication=no -o StrictHostKeyChecking=no -o ConnectTimeout=2"

#linux
ping -c  1 -W 1 $IP > /dev/null 2>/dev/null
#windows 
#ping -n 1 -w 1000 $IP > /dev/null 2>/dev/null
if [ "0" -ne "$?" ]; then
   echo "IP:$IP down." 
   exit 2;
fi

echo "$IP will rm -rf $APK_ANDROID_PATH " /dev/null 2>/dev/null

ssh $HOSTCHECK $IP "rm -rf $APK_ANDROID_PATH; am force-stop com.migu.controller; am force-stop com.migu.agent " > /dev/null 2>/dev/null

exit 0
