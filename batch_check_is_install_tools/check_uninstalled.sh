#! /bin/sh
IP=$1
PACKAGE=$2
PKG_NAME_CHECK="package:"$PACKAGE

if [ "$IP" == "" ]; then
    echo "ip empty."
    exit 1;
fi;

if [ "$PACKAGE" == "" ]; then
    echo "package name empty."
    exit 1;
fi;


RESULT_SUCCESS="Operation successfully"
RESULT_FAILED="Operation failed"

CERT_PATH=~/id_rsa

BOOTCLASSPATH=/system/framework/core.jar:/system/framework/conscrypt.jar:/system/framework/okhttp.jar:/system/framework/core-junit.jar:/system/framework/bouncycastle.jar:/system/framework/ext.jar:/system/framework/framework.jar:/system/framework/framework2.jar:/system/framework/telephony-common.jar:/system/framework/voip-common.jar:/system/framework/mms-common.jar:/system/framework/android.policy.jar:/system/framework/services.jar:/system/framework/apache-xml.jar:/system/framework/webviewchromium.jar:/system/framework/userExperienceService.jar

HOSTCHECK="-i $CERT_PATH -o PasswordAuthentication=no -o StrictHostKeyChecking=no -o ConnectTimeout=2 -o ServerAliveInterval=3"

check_app_install()
{
    GAME_LIST=`ssh $HOSTCHECK $IP "export BOOTCLASSPATH=$BOOTCLASSPATH; pm list package -3"`
    if [ "0" -ne "$?" ]; then
        echo "IP:$IP unable to connect with ssh."
        exit -1;
    fi
    install=0
    for line in $GAME_LIST
    do
        if [[ "$line" == "$PKG_NAME_CHECK" ]]
        then
            install=1
        fi
    done
    return $install
}

#linux
ping -c  1 -W 1 $IP > /dev/null 2>/dev/null
#windows 
#ping -n 1 -w 1000 $IP > /dev/null 2>/dev/null
if [ "0" -ne "$?" ]; then
   echo "IP:$IP down." 
   echo "IP:$IP down." >> dowm_check.out
   exit 2;
fi

ssh $HOSTCHECK $IP pwd > /dev/null 2>/dev/null
if [ "0" -ne "$?" ]; then
    echo "IP:$IP unable to connect with ssh."
    echo "IP:$IP unable to connect with ssh." >> fa_check.out 
    exit 2;
fi

#ssh $HOSTCHECK $IP "pm list package | grep $PACKAGE" > /dev/null 2>/dev/null
#echo $? 456
check_app_install
PACKAGE_COUNT=`echo $?`
if [ "0" -eq $PACKAGE_COUNT ]; then
   echo $IP has not install $PACKAGE
   echo $IP has not install $PACKAGE >> a_check.out
   exit 0;
fi

 echo $IP has installed $PACKAGE >> b_check.out

#ssh $HOSTCHECK $IP "export BOOTCLASSPATH=$BOOTCLASSPATH; pm list package -3 | grep $PACKAGE | wc -l" > /dev/null 2>/dev/null
#echo $? 123
#if [ "0" -ne "$?" ]; then
#   echo $RESULT_FAILED
#   exit 2;
#fi

exit 0;
