#!/bin/bash

whatToDoe = $wtd

if [$wtd == "-f"]
then

#get file name
  echo "Enter name of file"
  read name
elif [$wtd == "-d"]

#actually find file
cat / | grep $name.*
then

#get directory name
  echo "Enter name of directory"
  read name
  
  #actually find directory
  cat / | grep /$name
fi
