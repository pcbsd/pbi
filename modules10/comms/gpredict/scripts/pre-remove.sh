#!/bin/sh

cd /home
for i in `ls` 
   do 
     if [ -d "/home/${i}/.gpredict" ] 
     then 
       if [ "$?" = "0" ] 
       then 
         rm -R /home/${i}/.gpredict
       fi 
     fi 
   done
