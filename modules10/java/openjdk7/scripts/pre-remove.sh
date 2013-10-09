#!/bin/sh

rm /usr/local/openjdk7
rm /usr/local/bin/javavm
rm /usr/local/bin/classpath

cd ${PBI_PROGDIRPATH}

while read line
do
 rm /usr/local/bin/${line}
done < bin-links

cd /home
for i in `ls`
do
  if [ -e "${i}/.mozilla/plugins/IcedTeaPlugin.so" ]
  then
    rm /home/${i}/.mozilla/plugins/IcedTeaPlugin.so
  fi
done
