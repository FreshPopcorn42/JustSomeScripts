#!/bin/bash

cd /home/$USERNAME/Downloads
git pull https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/README.md

while read line; do echo $line; done < /home/$USERNAME/Downloads/Readme.md
echo \n
echo "Which script may I download for you dearest? 
Enter one after one."
read choice[]

read choice

/home/$USERNAME/Downloads
