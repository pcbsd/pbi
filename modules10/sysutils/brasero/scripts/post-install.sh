#!/bin/sh

SCHDIR=share/glib-2.0/schemas
SCHFILE=${SCHDIR}/org.gnome.brasero.gschema.xml
#sym link the brasero config schema into the local system
if [ ! -e /usr/local/${SCHFILE} ]; then
  ln -s ${PBI_PROGDIRPATH}/${SCHFILE} /usr/local/${SCHFILE}
fi
#recompile the local system schemas
BASE=/usr/local #use the locally installed binary if possible
if [ ! -e ${BASE}/bin/glib-compile-schemas ]; then
  BASE=${PBI_PROGDIRPATH}  #use the binary in the PBI instead
fi
${BASE}/bin/glib-compile-schemas /usr/local/${SCHDIR}
