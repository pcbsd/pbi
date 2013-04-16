#!/bin/sh


cd /home
for i in *
   do 
     if [ -d "/home/${i}/.predict" ] 
     then 
       if [ "$?" = "0" ] 
       then 
         rm -R /home/${i}/.predict
       fi 
     fi 
   done
