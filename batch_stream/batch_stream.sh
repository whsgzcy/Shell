
for IP in `cat ip.txt`
do
        echo  "stream.sh ${IP}"
        echo  `bash stream.sh ${IP}`
        sleep 1
done;
