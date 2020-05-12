#! /bin/sh
IP=$1
APK_REMOTE_PATH=$2
FILE_NAME=$3

if [ "$IP" == "" ]; then
    echo "ip empty."
    exit 1;
fi;

RESULT_SUCCESS="Operation successfully"
RESULT_FAILED="Operation failed"

APK_ANDROID_PATH=/data/lxc_volumns/system/etc

MOUNT_PATH=/data/lxc_volumns/system/priv-app/PlayerLauncherOEM

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

################
#1、检查是否存在路径及文件
# /data/lxc_volumns/system/priv-app/PlayerLauncherOEM/
# PlayerLauncherOEM.apk
# 路径不存在即创建 存在则删去所有文件
# 赋予权限

# 2、reboot

# 记录ipdown情况以及 scp 成功情况

#ssh $HOSTCHECK $IP  "umount /data/lxc_volumns/system;busybox mount -t ext4 -o loop /data/lxc_volumns/system_container.img /data/lxc_volumns/system;umount /data/lxc_volumns/root;busybox mount -t ext4 -o loop /data/lxc_volumns/root_container.img /data/lxc_volumns/root" > /dev/null 2>/dev/null

#TT=/sdcard/DCIM/migu.txt
#ssh $HOSTCHECK $IP "[ -f ${TT} ]" >/dev/null 2>&1
#if [ $? -ne 1 ]
#then
#    echo has file    
#else
#    echo no file
#   # mkdir -p /data/lxc_volumns/system/priv-app/PlayerLauncherOEM  
#fi

ssh $HOSTCHECK $IP "[ -d ${MOUNT_PATH} ]" >/dev/null 2>&1
if [ $? -ne 1 ] 
then       
    echo has existed    
else
    echo no path
   # mkdir -p /data/lxc_volumns/system/priv-app/PlayerLauncherOEM  
fi

 

exit 0


#echo "scp  $HOSTCHECK $APK_REMOTE_PATH/$FILE_NAME $IP:$APK_ANDROID_PATH/" /dev/null 2>/dev/null
#scp  $HOSTCHECK $APK_REMOTE_PATH/$FILE_NAME $IP:$APK_ANDROID_PATH/
#if [ "0" -ne "$?" ]; then
#    echo "IP:$IP scp failed."
#    exit 2;
#fi

#ssh $HOSTCHECK $IP "chown system:system /data/lxc_volumns/system/etc/business-conf.xml ; chmod 0600 /data/lxc_volumns/system/etc/business-conf.xml" > /dev/null 2>/dev/null

(ssh $HOSTCHECK $IP "reboot" > /dev/null 2>/dev/null)&

exit 0
