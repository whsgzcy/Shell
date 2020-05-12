i=0
for IP in `cat ip.txt`
do
       ((i++))
       echo  `bash  monkey_wm.sh ${IP}`
done;

echo  "has opened and wm size ${i} 设备数"

sleep 20

i=0

for IP in `cat ip.txt`
do
       ((i++))
       if ((   i==200  ))
        then
                ((i=0))
                sleep 600
        fi

       echo  `bash input_tap.sh ${IP}`
done;

echo "will sleep 30 mines"

sleep 1800

for IP in `cat ip.txt`
do
	echo `bash force-stop.sh ${IP}`

done;

exit 0
