
for IP in `cat ip_f.txt`
do
        echo  "wm_size.sh ${IP}"
        echo  `bash wm_size.sh ${IP}`
        sleep 1
done;
