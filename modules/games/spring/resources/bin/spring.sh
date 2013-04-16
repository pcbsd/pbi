#!/bin/sh

PROGDIR=CHANGEME

# Check if we have any mods / maps installed
NUM=`ls ${PROGDIR}/share/spring/mods | wc -l | tr -d ' '`
if [ "${NUM}" = "0" ]
then
   zenity --question --text="The ${PROGDIR}/share/spring/mods folder does not contain any games. Do you wish to open a browser to the games list?"
   if [ "$?" = "0" ]
   then
      openwith http://spring.clan-sy.com/
      exit 0
   fi
fi

# Check if we have any maps installed
NUM=`ls ${PROGDIR}/share/spring/maps | wc -l | tr -d ' '`
if [ "${NUM}" = "0" ]
then
   zenity --question --text="The ${PROGDIR}/share/spring/maps folder does not contain any maps. Do you wish to open a browser to the games list?"
   if [ "$?" = "0" ]
   then
      openwith http://spring.clan-sy.com/
      exit 0
   fi
fi


${PROGDIR}/bin/spring $@
