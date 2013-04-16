#!/bin/sh

echo "Finding all modules that need to be converted to OptionsNG"
echo ""
for i in `find . | grep pbi.conf`
do
  chk=`cat ${i} | grep PBI_MAKEOPTS | grep WITH`
  if [ -n "${chk}" ]; then
    PDIR=`echo "${i}" | cut -d / -f 2-3`
    if [ -n "`grep -r "OPTIONS_DEFINE=" /usr/ports/${PDIR}`" ]; then
      echo ${i}
    else
      echo "${i} (port not converted yet)"
    fi
  fi

done
