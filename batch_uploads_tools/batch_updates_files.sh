FILE_PATH=/data/nfs/system_apk/batch_uploads/
FILE_NAME=test.xml

if [ "$FILE_NAME" == "" ]; then
    echo "file_name empty."
    exit 1;
fi;

for IP in `cat ip.txt`
do
        echo  "bash ${FILE_PATH}updates_files.sh ${IP} ${FILE_PATH} ${FILE_NAME}"
        echo  `bash updates_files.sh ${IP} ${FILE_PATH} ${FILE_NAME}`
done;
