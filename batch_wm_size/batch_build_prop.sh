
for IP in `cat ip_p.txt`
do
        echo  "updates_build_prop.sh ${IP}"
        echo  `bash updates_build_prop.sh ${IP}`
        sleep 1
done;
