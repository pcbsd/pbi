#!/bin/sh

#make sure the config file is read/write for user
for i in `ls /home/`
do

dir=/home/${i}/.wbar
if [ ! -f ${dir} ]; then
  echo "sample" > ${dir}
fi
chmod 766 ${dir}

done
