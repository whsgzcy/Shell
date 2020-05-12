FILE_PATH=/data/nfs/system_apk/sh/batch_upload_ulimit_files
FILE_NAME=install-recovery.sh

if [ "$FILE_NAME" == "" ]; then
    echo "file_name empty."
    exit 1;
fi;

for IP in `cat ip_p.txt`
do
        echo  "bash ${FILE_PATH}updates_business-conf.sh ${IP} ${FILE_PATH} ${FILE_NAME}"
        echo  `bash updates_business-conf.sh ${IP} ${FILE_PATH} ${FILE_NAME}
        sleep 1`
done;
