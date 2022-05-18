#!/bin/bash

> /home/$username/MySys$date.sh

#Get user
'#Get user' >> /home/$username/MySys$date.sh
w | grep >> /home/$username/MySys$date.sh
$MAIL >> /home/$username/MySys$date.sh

'#Shell' >> /home/$username/MySys$date.sh
$SHELL >> /home/$username/MySys$date.sh

'\n' >> /home/$username/MySys$date.sh

#CPU/RAM consumtion
'#Top' >> /home/$username/MySys$date.sh
top >> /home/$username/MySys$date.sh

'\n' >> /home/$username/MySys$date.sh

#Net. conn.
'#Ping 8.8.8.8' >> /home/$username/MySys$date.sh
ping 8.8.8.8 >> /home/$username/MySys$date.sh
'\n' >> /home/$username/MySys$date.sh
'#My dev' >> /home/$username/MySys$date.sh
ifconfig >> /home/$username/MySys$date.sh
'\n' >> /home/$username/MySys$date.sh


'#NETSTAT' >> /home/$username/MySys$date.sh
netstat -a | less >> /home/$username/MySys$date.sh

cp /home/$username/MySys$date.sh /home/$username/MySysArchive´
echo 'Delete SysFile in user-home-dir? [y/n]'
read del

if [$del == 'n' || $del == 'N' || $del == no || $del == 'No' || $del == 'NO']
then
	rm /home/$username/MySys$date.sh
fi

echo Mail it to someone? [y/n]
read mail

if [$mail == 'y' || $mail == 'Y' || $mail == yes || $mail == 'Yes' || $mail == 'YES']
then
	mail -s 'System information of $USER on $HOSTNAME' $mail < /home/$username/MySysArchive/MySys$date.sh
else
	break
fi



