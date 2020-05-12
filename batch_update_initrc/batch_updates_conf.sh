
for IP in `cat ip_p.txt`
do
        echo  "bash updates_initrc_conf.sh ${IP}"
        echo  `bash updates_initrc_conf.sh ${IP}`
        sleep 1
done;
