#!/bin/bash

apt-get update
apt-get install upgrade

#Create file
> /etc/profile.d/proxy.sh


#set proxy, SHOULD APPLY FOR ALL USERS
'# set proxy config via profile.d - should apply' >> /etc/profile.d/proxy.sh

'#' >> /etc/profile.d/proxy.sh

echo http (IP only)
read http

if [$http == 'skip' || $http = 'Skip' || $http == 'SKIP']
then
	break
elif [$http == null]
then
	'export http_proxy="http://127.0.0.1:8080/"' >> /etc/profile.d/proxy.sh
elif [$http > null]
then
'export http_proxy="http://$http:8080/"' >> /etc/profile.d/proxy.sh
fi


echo https (IP only)
read https
if [$https == 'skip' || $https = 'Skip' || $https == 'SKIP']
then
	break
elif [$https == null]
then
	'export https_proxy="http://127.0.0.1:8080/"' >> /etc/profile.d/proxy.sh
elif [$https > null]
then
'export https_proxy="http://$https:8080/"' >> /etc/profile.d/proxy.sh
fi


echo ftp (IP only)
read ftp
if [$fdp == 'skip' || $fdp = 'Skip' || $fdp == 'SKIP']
then
	break
elif [$fdp == null]
then
	'export ftp_proxy="http://127.0.0.1:8080/"' >> /etc/profile.d/proxy.sh
elif [$fdp > null]
then
'export ftp_proxy="http://$ftp:8080/"' >> /etc/profile.d/proxy.sh
fi

echo sftp (IP only)
read sftp
if [$sftp == 'skip' || $sftp = 'Skip' || $sftp == 'SKIP']
then
	break
elif [$sftp == null]
then
	'export sftp_proxy="http://127.0.0.1:8080/"' >> /etc/profile.d/proxy.sh
elif [$sftp > null]
then
'export sftp_proxy="http://$sftp:8080/"' >> /etc/profile.d/proxy.sh
fi


'export no_proxy="127.0.0.1,localhost"' >> /etc/profile.d/proxy.sh

'\n' >> /etc/profile.d/proxy.sh


#For curl
'# For curl' >> /etc/profile.d/proxy.sh
'export HTTP_PROXY="http://$http/"' >> /etc/profile.d/proxy.sh

'export HTTPS_PROXY="http://$https/"' >> /etc/profile.d/proxy.sh

'export FTP_PROXY="http://$ftp/"' >> /etc/profile.d/proxy.sh

'export SFTP_PROXY="http://$sftp/"' >> /etc/profile.d/proxy.sh

'export NO_PROXY="127.0.0.1,localhost"' >> /etc/profile.d/proxy.sh

#Make it executable
sudo chmod +x  /etc/profile.d/proxy.sh

#Make stuff happen
source /etc/profile.d/proxy.sh

#Show whats up
env | grep -i proxy
