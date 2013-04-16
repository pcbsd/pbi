#!/bin/sh

cd /home
for i in `ls` 
   do 
     if [ -d "/home/${i}/.kb" ] 
     then 
       if [ "$?" = "0" ] 
       then 
         rm -R /home/${i}/.kb
       fi 
     fi 
   done
