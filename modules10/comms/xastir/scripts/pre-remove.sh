#!/bin/sh

cd /home
for i in `ls` 
   do 
     if [ -d "/home/${i}/.xastir" ] 
     then 
       if [ "$?" = "0" ] 
       then 
         rm -R /home/${i}/.xastir
       fi 
     fi 
   done
