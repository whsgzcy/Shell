
for IP in `cat ip.txt`
do
        echo  "bash kill_app.sh ${IP} "
        echo  `bash kill_app.sh ${IP}`
done;
