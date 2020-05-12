#!/bin/bash


rm -rf *.out
rm -rf ip_shuf.txt

shuf ip.txt  -o ip_shuf.txt

for IP in `cat ip_shuf.txt`
do
        echo  "bash remove.sh ${IP}"
        echo `bash remove.sh ${IP}`

        sleep 1
done;
