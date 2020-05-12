#!/bin/bash

FILE_PATH=/data/nfs/system_apk/batch_uninstall_tools/



for IP in `cat ip.txt`
do
	echo `bash app_check.sh ${IP}`
done;
