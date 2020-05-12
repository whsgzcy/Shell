FILE_PATH=/nfs_apk/baidu-test/system_apk
FILE_NAME=business-conf.xml

if [ "$FILE_NAME" == "" ]; then
    echo "file_name empty."
    exit 1;
fi;

for IP in `cat ip_p.txt`
do
        echo  "bash ${FILE_PATH}updates_business-conf.sh ${IP} ${FILE_PATH} ${FILE_NAME}"
        echo  `bash updates_business-conf.sh ${IP} ${FILE_PATH} ${FILE_NAME}`
done;
