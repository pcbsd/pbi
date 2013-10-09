#!/bin/sh

#Fix the identical linux/freebsd library mess
echo "Removing FreeBSD versions of idential Linux Libraries:"
for i in `ls ${PBI_PROGDIRPATH}/linuxlib/`
do

  if [ -f ${PBI_PROGDIRPATH}/lib/${i} ]; then
    rm ${PBI_PROGDIRPATH}/lib/${i}
    echo " - ${i}"
  fi
  ln -s ${PBI_PROGDIRPATH}/linuxlib/${i} ${PBI_PROGDIRPATH}/lib/${i}

done
