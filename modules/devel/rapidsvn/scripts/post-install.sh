#!/bin/sh

#make sure the libgdbm.so.3 library is there
cd ${PBI_PROGDIRPATH}/lib
if [ ! -f libgdbm.so.3 ]; then
  #link the .so.3 lib to the current version
  ln -s `ls libgdbm.so.*` libgdbm.so.3
fi
