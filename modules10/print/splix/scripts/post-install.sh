#!/bin/sh

if [ -d "/PCBSD/local/etc/fonts" ]
then
  BASE="/PCBSD/local"
else
  BASE="/usr/local"
fi

cd ${PBI_PROGDIRPATH}/share/cups/model
find * | grep ppd > ${PBI_PROGDIRPATH}/ppd.lst

while read line
do
  BASENAME=`basename $line`
  ln -s ${PBI_PROGDIRPATH}/share/cups/model/${line} ${BASE}/share/cups/model/${BASENAME}
done < ${PBI_PROGDIRPATH}/ppd.lst

ln -s ${PBI_PROGDIRPATH}/${PBI_FAKEBINDIR}/rastertoqpdl ${BASE}/libexec/cups/filter/rastertoqpdl
ln -s ${PBI_PROGDIRPATH}/${PBI_FAKEBINDIR}/pstoqpdl ${BASE}/libexec/cups/filter/pstoqpdl
