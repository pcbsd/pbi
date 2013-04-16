#!/bin/sh
# 1 = PBI Name
# 2 = Title

PROGNAME="CHANGEME"

kdialog --title "Confirm Removal" --yesno "Are you sure you want to remove ${PROGNAME}?"
if [ "$?" = "0" ]
then
  kdialog --passivepopup "Removing ${PROGNAME}..." 10000 &
  PID=$!

  kdesu "PBIdelete -remove ${PROGNAME}" 

  kill -9 $PID
  kdialog --msgbox "${PROGNAME} was removed!"
fi

