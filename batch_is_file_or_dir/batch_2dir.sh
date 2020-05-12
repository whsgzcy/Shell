
for IP in `cat ip.txt`
do
        echo  "file2dir.sh ${IP}"
        echo  `bash file2dir.sh ${IP}`
done;
