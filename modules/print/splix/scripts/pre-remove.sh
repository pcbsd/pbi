#!/bin/sh

if [ -d "/PCBSD/local/etc/fonts" ]
then
  BASE="/PCBSD/local"
else
  BASE="/usr/local"
fi


while read line
do
  BASENAME=`basename $line`
  if [ -h "${BASE}/share/cups/model/${BASENAME}" ]
  then
    rm ${BASE}/share/cups/model/${BASENAME}
  fi
done < ${PBI_PROGDIRPATH}/ppd.lst

rm ${BASE}/libexec/cups/filter/pstoqpdl
rm ${BASE}/libexec/cups/filter/rastertoqpdl
