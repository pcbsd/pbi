#!/bin/sh

SCHDIR=share/glib-2.0/schemas
SCHFILE=${SCHDIR}/org.gnome.brasero.gschema.xml
#remove the sym link of the brasero config schema 
if [ -L /usr/local/${SCHFILE} ]; then
  rm /usr/local/${SCHFILE}
fi
#recompile the local system schemas
BASE=/usr/local #use the locally installed binary if possible
if [ ! -e ${BASE}/bin/glib-compile-schemas ]; then
  BASE=${PBI_PROGDIRPATH}  #use the binary in the PBI instead
fi
${BASE}/bin/glib-compile-schemas /usr/local/${SCHDIR}
