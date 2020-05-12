
for IP in `cat ip.txt`
do
        echo  "bash rm_out_file.sh ${IP} "
        echo  `bash rm_out_file.sh ${IP}`
done;
