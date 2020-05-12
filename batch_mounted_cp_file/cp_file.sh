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

T_PATH=/data/data/com.tencent.tmgp.sgame/shared_prefs/msdk.xml

#T_PATH=/sdcard/DCIM/migu.txt

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

#####test
echo test
exit 0


#sh $HOSTCHECK $IP "[ -f ${TT} ]" >/dev/null 2>&1
#if [ $? -ne 1 ]
#then
#    echo has file    
#else
#    echo no file
#   # mkdir -p /data/lxc_volumns/system/priv-app/PlayerLauncherOEM  
#fi

ssh $HOSTCHECK $IP "if [ ! -f "${T_PATH}" ]; then
echo no_ex
exit $IP
else
rm -r ${T_PATH}
cp /data/nfs/system_apk/msdk.xml /data/data/com.tencent.tmgp.sgame/shared_prefs/
echo yes
fi"

#ssh $HOSTCHECK $IP "rm -r /data/data/com.tencent.tmgp.sgame/shared_prefs/msdk.xml" > /dev/null 2>/dev/null

#ssh $HOSTCHECK $IP "rm -r ${T_PATH}" > /dev/null 2>/dev/null

#ssh $HOSTCHECK $IP "cp /data/nfs/system_apk/migu.txt /sdcard/DCIM/" > /dev/null 2>/dev/null

#ssh $HOSTCHECK $IP "cp /data/nfs/system_apk/msdk.xml /data/data/com.tencent.tmgp.sgame/shared_prefs" > /dev/null 2>/dev/null
exit 0
