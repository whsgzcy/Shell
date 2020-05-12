
for IP in `cat ip.txt`
do
        echo  "bash pm_clear.sh ${IP} "
        echo  `bash pm_clear.sh ${IP}`
done;
