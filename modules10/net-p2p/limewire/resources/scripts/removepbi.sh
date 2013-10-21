#!/bin/sh

PBI="CHANGEME"

kdialog --title "Confirm Removal" --yesno "Are you sure you want to remove ${PBI}?"
if [ "$?" = "0" ]
then
  kdialog --passivepopup "Removing ${PBI}..." 10000 &
  PID=$!

  kdesu "PBIdelete -remove ${PBI}" 
  kill -9 $PID
  kdialog --msgbox "${PBI} was removed."
fi

