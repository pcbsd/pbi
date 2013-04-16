#!/bin/sh

PROGDIR=CHANGEME

#Set the data dirs properly before starting up the program
export XDG_DATA_DIRS=${PROGDIR}/share

#Startup the program
${PROGDIR}/bin/zim
