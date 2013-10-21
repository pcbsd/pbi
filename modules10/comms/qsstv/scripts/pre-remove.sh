#!/bin/sh

cd /home
for i in *
   do 
     if [ -d "/home/${i}/.qt/qsstv6rc" ] 
     then 
       if [ "$?" = "0" ] 
       then 
         rm -R /home/${i}/.qt/qsstv*
       fi 
     fi 
   done
