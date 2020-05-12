
for IP in `cat ip.txt`
do
        echo  "bash cp_file.sh ${IP} "
        echo  `bash cp_file.sh ${IP}`
done;
