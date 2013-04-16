#!/bin/sh

LANGFILE="kbackup.mo"
mkdir ${PBI_PROGDIRPATH}/locale/
cd /usr/local/share/locale
for i in `ls`
do
  if [ -e "/usr/local/share/locale/${i}/LC_MESSAGES/${LANGFILE}" ]
  then
    mkdir ${PBI_PROGDIRPATH}/locale/${i}
    cp /usr/local/share/locale/${i}/LC_MESSAGES/${LANGFILE} ${PBI_PROGDIRPATH}/locale/${i}/
  fi
done

