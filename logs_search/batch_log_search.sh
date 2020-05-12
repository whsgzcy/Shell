#!/bin/bash

FILE_PATH=/data/nfs/system_apk/batch_uninstall_tools/
PACKAGE_NAME=$1

if [ $# != 1 ] ; then
        echo "USAGE: $0 package_name"
        exit 1;
fi


if [ "$PACKAGE_NAME" == "" ]; then
    echo "package name empty."
    exit 1;
fi;


for IP in `cat ip.txt`
do
      # echo	"bash ${FILE_PATH}log_check.sh ${IP} ${PACKAGE_NAME}"
	echo `bash log_check.sh ${IP} ${PACKAGE_NAME}`
done;
