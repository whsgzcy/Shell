#!/bin/bash

FILE_PATH=/data/nfs/system_apk
FILE_NAME=$1
PACKAGE_NAME=$2

if [ $# != 2 ] ; then
        echo "USAGE: $0 file_name package_name"
        exit 1;
fi

if [ "$FILE_NAME" == "" ]; then
    echo "file_name empty."
    exit 1;
fi;

if [ "$PACKAGE_NAME" == "" ]; then
    echo "package name empty."
    exit 1;
fi;

rm -rf *.out
rm -rf ip_shuf.txt

shuf ip.txt  -o ip_shuf.txt

for IP in `cat ip_shuf.txt`
do
        echo  "bash ${FILE_PATH} app_install.sh ${IP} ${FILE_PATH} ${FILE_NAME} ${PACKAGE_NAME}"
        echo `bash app_install.sh ${IP} ${FILE_PATH} ${FILE_NAME} ${PACKAGE_NAME}`

        sleep 2
done;
