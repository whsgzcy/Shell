#! /bin/sh
IP=$1
APK_REMOTE_PATH=$2
FILE_NAME=$3

if [ "$IP" == "" ]; then
    echo "ip empty."
    exit 1;
fi;

if [ "$FILE_NAME" == "" ]; then
    echo "file name empty."
    exit 1;
fi;



RESULT_SUCCESS="Operation successfully"
RESULT_FAILED="Operation failed"

APK_ANDROID_PATH=/data/migu_etc


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

#ssh $HOSTCHECK $IP "mount -o remount,rw /system" > /dev/null 2>/dev/null

#ssh $HOSTCHECK $IP "umount /data/lxc_volumns/system" > /dev/null 2>/dev/null

#ssh $HOSTCHECK $IP "busybox mount -t ext4 -o loop,rw /data/lxc_volumns/system_container.img /data/lxc_volumns/system" > /dev/null 2>/dev/null

ssh $HOSTCHECK $IP "rm -rf /data/migu_etc/test.xml" > /dev/null 2>/dev/null

echo "scp  $HOSTCHECK $APK_REMOTE_PATH/$FILE_NAME $IP:$APK_ANDROID_PATH/" /dev/null 2>/dev/null
scp  $HOSTCHECK $APK_REMOTE_PATH/$FILE_NAME $IP:$APK_ANDROID_PATH/
if [ "0" -ne "$?" ]; then
    echo "IP:$IP scp failed."
    exit 2;
fi

ssh $HOSTCHECK $IP " chmod 777 -R  /data/migu_etc" > /dev/null 2>/dev/null

ssh $HOSTCHECK $IP "am force-stop com.migu.controller " > /dev/null 2>/dev/null

#(ssh $HOSTCHECK $IP "reboot" > /dev/null 2>/dev/null)&

exit 0
