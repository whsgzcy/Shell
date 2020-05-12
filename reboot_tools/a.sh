
FILE_PATH=/data/nfs/system_apk/sh/reboot_tools
IPS=$1

array=(${IPS//,/ })  
 


cd $FILE_PATH



i=0
for IP in ${array[@]}
do
   

       echo  "bash ${FILE_PATH} reboot.sh ${IP} "
       
done;
