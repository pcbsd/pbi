#!/bin/sh

cd /home
for i in `ls` 
   do 
     if [ -d "/home/${i}/.geoid" ] 
     then 
       if [ "$?" = "0" ] 
       then 
         rm -R /home/${i}/.geoid
       fi 
     fi 
   done
