i=0
for IP in `cat ip.txt`
do
       ((i++))
       if ((   i==100  ))
        then
                ((i=0))
                sleep 24000
        fi
       echo  `bash  monkey_wm.sh ${IP}`
done;

exit 0
