#!/bin/bash

FILE_PATH=$pwd
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

for IP in `cat ip.txt`
do
        echo  "bash ${FILE_PATH} app_install.sh ${IP} ${FILE_PATH} ${FILE_NAME} ${PACKAGE_NAME}"
        echo `bash app_install.sh ${IP} ${FILE_PATH} ${FILE_NAME} ${PACKAGE_NAME}`

        sleep 2
done;
