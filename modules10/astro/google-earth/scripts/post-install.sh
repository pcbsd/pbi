#!/bin/sh

#If there are both linux and FreeBSD versions of a lib, remove the FreeBSD one.
#cd ${PBI_PROGDIRPATH}/linuxlib
#for i in `ls *.so*`
#do
#  if [ -e ${PBI_PROGDIRPATH}/lib/${i} ]; then
#    rm ${PBI_PROGDIRPATH}/lib/${i}
#  fi
#done

#copy the linux version of the libGL library into the lib/ folder
#cp ${PBI_PROGDIRPATH}/linuxlib/libGL.so* ${PBI_PROGDIRPATH}/lib/.
