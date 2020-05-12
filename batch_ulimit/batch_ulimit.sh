FILE_PATH=/data/nfs/system_apk/sh/batch_ulimit

cd $FILE_PATH


i=0
for IP in `cat ip.txt`
do
       ((i++))
       if ((   i==80  ))
        then
                ((i=0))
                sleep 10
        fi

       echo  "bash ulimit.sh ${IP} "
       echo  `bash ulimit.sh ${IP}`
done;
