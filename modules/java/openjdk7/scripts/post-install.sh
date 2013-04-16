#!/bin/sh

cd ${PBI_PROGDIRPATH}

ln -s ${PBI_PROGDIRPATH}/openjdk7 /usr/local/openjdk7
ln -s ${PBI_PROGDIRPATH}/bin/javavm /usr/local/bin/javavm
ln -s ${PBI_PROGDIRPATH}/bin/classpath /usr/local/bin/classpath

while read line
do
 ln -s /usr/local/bin/javavm /usr/local/bin/${line}
done < bin-links

ARCH="`uname -m`"

cd /home
for i in `ls`
do
  if [ -e "${i}/.mozilla/plugins" ]
  then
    ln -fs ${PBI_PROGDIRPATH}/lib/IcedTeaPlugin.so /home/${i}/.mozilla/plugins/IcedTeaPlugin.so
    chown ${i}:${i} /home/${i}/.mozilla/plugins/IcedTeaPlugin.so
  fi
done
