#!/bin/sh

cd /home 
for i in `ls` 
do 
   if [ -d "/home/${i}/.warzone2100" ] 
   then 
     if [ "$?" = "0" ] 
     then 
       rm -fR /home/${i}/.warzone2100
     fi 
   fi 
done 
