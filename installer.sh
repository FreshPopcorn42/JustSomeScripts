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
    git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/update.sh
  
  elif [$item == 'updatePlus']
  then
    git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/updatePlus.sh
  
  elif [$item == 'newOSversion']
  then
    git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/newOSversion.sh
  
  elif [$item == 'brightness']
  then
    git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/brightness.sh
  
  elif [$item == 'SysToFile']
  then
    git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/SysToFile.sh
  
  elif [$item == 'Schneewittchen']
  then
    git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/Schneewittchen.sh
  
  elif [$item == 'ProxyDoe']
  then
    git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/ProxyDoe.sh
  
  elif [$item == 'ProtocolZeroControl']
  then
    git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/ProtocolZeroControl.sh
  
  elif [$item == 'InstallSetup']
  then
    git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/InstallSetup.sh
  
  elif [$item == 'Flatpak']
  then
    git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/Flatpak.sh
  
  elif [$item == 'Firefox']
  then
    git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/Firefox.sh
  
  elif [$item == 'CheckIPs']
  then
    git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/CheckIPs.sh
  
  elif [$item == 'NotScripts']
    if [$item ==]
    then
    
    fi
  
  elif [$item == 'USB']
    if [$item ==]
    then
    
    fi
 
  elif [$item == 'Wifi']
    echo V1 or V2?
    if [$item == 'V1']
    then
      git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/Wifi/wifi_V1.sh
    elif [$item == 'V2']
    then
      git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/Wifi/wifi_V2.sh
    fi
  fi

rm -rf /home/$USERNAME/Downloads/Readme.md
