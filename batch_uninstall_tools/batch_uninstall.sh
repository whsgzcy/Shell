#!/bin/bash

FILE_PATH=/data/nfs/system_apk/sh/batch_uninstall_tools/
PACKAGE_NAME=$1

if [ $# != 1 ] ; then
        echo "USAGE: $0 package_name"
        exit 1;
fi


if [ "$PACKAGE_NAME" == "" ]; then
    echo "package name empty."
    exit 1;
fi;

rm -rf *.out

for IP in `cat ip.txt`
do
       echo	"bash ${FILE_PATH}app_uninstall.sh ${IP} ${PACKAGE_NAME}"
	echo `bash app_uninstall.sh ${IP} ${PACKAGE_NAME}`
done;
