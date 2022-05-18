#!/bin/bash

cd /home/$USERNAME/Downloads
git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/README.md

while read line; do echo $line; done < /home/$USERNAME/Downloads/Readme.md
echo \n
echo "Which script may I download for you dearest? 
Enter one after one."
read choice[]
read choice

for item in $choice[]
do
  if [$item == 'update']
  then
    git pull
  elif [$item == 'updatePlus']
  then
    git pull
  elif [$item == 'newOSversion']
  then
    git pull
  elif [$item == 'brightness']
  then
    git pull
  elif [$item == 'SysToFile']
  then
    git pull
  elif [$item == 'Schneewittchen']
  then
    git pull
  elif [$item == 'ProxyDoe']
  then
    git pull
  elif [$item == 'ProtocolZeroControl']
  then
    git pull
  elif [$item == 'InstallSetup']
  then
    git pull
  elif [$item == 'Flatpak']
  then
    git pull
  elif [$item == 'Firefox']
  then
    git pull
  elif [$item == 'CheckIPs']
  then
    git pull
  fi

rm -rf /home/$USERNAME/Downloads/Readme.md
