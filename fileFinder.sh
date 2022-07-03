#!/bin/bash

whatToDoe = $wtd

if [$wtd == "-f"]
then

#get file name
  echo "Enter name of file"
  read name
elif [$wtd == "-d"]

 #actually find file
  echo "In current directory:"
  cat ./ | grep $name.* | less

  echo "In all directorys:"
  cat / | grep $name.* | less
then

#get directory name
  echo "Enter name of directory"
  read name
  
 #actually find directory
  echo "In current directory:"
  cat ./ | grep /$name | less
  
  echo "In all directorys:"
  cat / | grep /$name | less
fi
