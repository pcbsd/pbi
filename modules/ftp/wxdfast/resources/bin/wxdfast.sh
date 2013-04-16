#!/bin/sh

PROGDIR="CHANGE"

# Unset the LANG variable if its set to en, which is default
if [ "$LANG" = "en_US" ]
then
  LANG="" ; export LANG
fi

/Programs/${PROGDIR}/bin/wxdfast "$@"
