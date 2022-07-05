#!/bin/bash

cd /home/$USERNAME/Downloads
git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/README.md

while read line; do echo $line; done < /home/$USERNAME/Downloads/Readme.md
echo \n
echo "Which script may I download for you dearest? 
Enter one after one."

i = 0
do
  read choice[i]
  i++
while [choice[i] != ""]



for item in $choice[]
do
  if [$item == 'update']
  then
    git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/update.sh
  
  elif [$item == 'updatePlus']
  then
    git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/updatePlus.sh
  
  elif [$item == 'fileFinder']
  then
    git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/fileFinder.sh
  
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
    echo "Wich one?
    -3D
    BackgroundBackup
    Schneewittchen for Windows [Schneewittchen]
    Websites
    "
    read item
    if [$item == '3D']
    then
      git pull https://github.com/FreshPopcorn42/JustSomeScripts/tree/main/NotScripts/3D
    elif [$item == BackgroundBackup]
    then
      git pull https://github.com/FreshPopcorn42/JustSomeScripts/tree/main/NotScripts/BackgroundBackup
    elif [$item == Schneewittchen]
    then
      git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/NotScripts/Schneewittchen.bat
    elif [$item == Websiter]
    then
      echo "Which one?
      -JDM
      "
      if [$item == JDM]
      then
      git pull https://github.com/FreshPopcorn42/JustSomeScripts/tree/main/NotScripts/Websites/JDM
      fi
    fi
  
  elif [$item == 'USB']
    echo usb or unmount?
    read item
    if [$item == 'usb']
    then
      git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/USB/usb.sh
    elif [$item == unmount]
    then
      git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/USB/unmount.sh
    fi
 
  elif [$item == 'Wifi']
    echo V1 or V2?
    read item
    if [$item == 'V1']
    then
      git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/Wifi/wifi_V1.sh
    elif [$item == 'V2']
    then
      git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/Wifi/wifi_V2.sh
    fi
  fi

rm -rf /home/$USERNAME/Downloads/Readme.md
