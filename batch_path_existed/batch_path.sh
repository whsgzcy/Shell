#!/bin/bash


rm -rf *.out
#rm -rf ip_shuf.txt

#shuf ip.txt  -o ip_shuf.txt

for IP in `cat ip.txt`
do
        echo  "bash path.sh ${IP}"
        echo `bash path.sh ${IP}`

done;
