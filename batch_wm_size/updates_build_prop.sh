#! /bin/sh
IP=$1

if [ "$IP" == "" ]; then
    echo "ip empty."
    exit 1;
fi;

RESULT_SUCCESS="Operation successfully"
RESULT_FAILED="Operation failed"

CERT_PATH=~/id_rsa

BOOTCLASSPATH=/system/framework/core.jar:/system/framework/conscrypt.jar:/system/framework/okhttp.jar:/system/framework/core-junit.jar:/system/framework/bouncycastle.jar:/system/framework/ext.jar:/system/framework/framework.jar:/system/framework/framework2.jar:/system/framework/telephony-common.jar:/system/framework/voip-common.jar:/system/framework/mms-common.jar:/system/framework/android.policy.jar:/system/framework/services.jar:/system/framework/apache-xml.jar:/system/framework/webviewchromium.jar:/system/framework/userExperienceService.jar

HOSTCHECK="-i $CERT_PATH -o PasswordAuthentication=no -o StrictHostKeyChecking=no -o ConnectTimeout=2"

#linux
ping -c  1 -W 1 $IP > /dev/null 2>/dev/null
#windows 
#ping -n 1 -w 1000 $IP > /dev/null 2>/dev/null
if [ "0" -ne "$?" ]; then
   echo "IP:$IP down." >> update_init.out 
   exit 2;
fi

ssh $HOSTCHECK $IP 'umount /data/lxc_volumns/system; busybox mount -t ext4 -o loop /data/lxc_volumns/system_container.img /data/lxc_volumns/system; sed -i "47asys.xxx.x_w=1080"  /data/lxc_volumns/system/build.prop;sed -i "48asys.xxx.x_h=1920"  /data/lxc_volumns/system/build.prop' > /dev/null 2>/dev/null

IP_F=${IP/108/109}

echo $IP_F

(ssh $HOSTCHECK $IP_F "reboot" > /dev/null 2>/dev/null)&

exit 0
