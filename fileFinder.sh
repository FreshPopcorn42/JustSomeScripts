#!/bin/bash

whatToDoe = $wtd

if [$wtd == "-f"]
then

#get file name
  echo "Enter name of file"
  read name
elif [$wtd == "-d"]
then

 #actually find file
  echo "In current directory:"
  cat ./ | grep $name.* && grep .$name.* | less
 
  echo "In all directories:"
  cat / | grep $name.* && grep .$name.* | less
  

#get directory name
  echo "Enter name of directory"
  read name
  
 #actually find directory
  echo "In current directory:"
  cat ./ | grep /$name && grep /.$name | less
  
  echo "In all directories:"
  cat / | grep /$name && grep /.$name | less
  
 
elif [$wtd == "-a"]
then


echo "Directory in current directory:"
  cat ./ | grep /$name && grep /.$name | less
 echo "File in current directory:"
  cat ./ | grep $name.* && grep .$name.* | less
  
 echo "Directory from all directories:"
  cat / | grep /$name && grep /.$name | less
 echo "Files from all directories:"
  cat / | grep $name.* && grep .$name.* | less

fi
