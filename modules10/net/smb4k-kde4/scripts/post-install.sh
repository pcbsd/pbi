#!/bin/sh

if [ ! -z "$PBI_PROGDIRPATH" ] ; then
  cd ${PBI_PROGDIRPATH}/bin
  rm sudo
  ln -s /usr/local/bin/sudo sudo
fi
