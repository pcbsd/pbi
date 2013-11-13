#!/bin/sh
PROGDIR=/usr/local

if [ ! -f ~/.nzbget ]; then
  #Copy the sample configuration file into the user's dir
  cp ${PROGDIR}/etc/nzbget.conf.sample ~/.nzbget
fi
#Start the main program
${PROGDIR}/bin/nzbget $@
