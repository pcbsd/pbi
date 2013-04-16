#!/bin/sh

cd /home 
 for i in `ls` 
 do 
   if [ -d "/home/${i}/.gimp-2.6" ] 
   then 
     if [ "$?" = "0" ] 
     then 
       rm -r /home/${i}/.gimp-2.6
     fi 
   fi 
 done 
