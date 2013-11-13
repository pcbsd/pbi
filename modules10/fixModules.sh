#!/bin/sh

#quick script to search for and fix all the pbi.conf's it is given
for i in $@
do
if [ ! "`basename ${i}`" == "pbi.conf" ]; then 
  continue
fi

#Run the pbi.conf to set the variables
. ${i}
CHANGED="NO"
PKGNAME=`basename ${PBI_MAKEPORT}`

#Remove trailing "/" from PBI_MAKEPORT
if [ ${PBI_MAKEPORT} != ${PBI_MAKEPORT%/} ]; then
  echo "Fixing Trailing / in PBI_MAKEPORT: ${i}"
  sed -i.bak "s,PBI_MAKEPORT=\"${PBI_MAKEPORT}\",PBI_MAKEPORT=\"${PBI_MAKEPORT%/}\",g" ${i}
  CHANGED="YES"
fi
#Remove the PBI_PROGWEB entry if the website exists in the package
if [ `pkg rquery %w ${PKGNAME}` ]; then
  echo "Removing PBI_PROGWEB entry: info exists in the package: ${i}"
  sed -i.bak "s,PBI_PROGWEB=\"${PBI_PROGWEB}\",PBI_PROGWEB=\"\",g" ${i}
  CHANGED="YES"
fi
#Remove the PBI_LICENSE entry if the license exists in the package
if [ `pkg rquery %L ${PKGNAME}` ]; then
  echo "Removing PBI_LICENSE entry: info exists in the package: ${i}"
  sed -i.bak "s,PBI_LICENSE=\"${PBI_LICENSE}\",PBI_LICENSE=\"\",g" ${i}
  CHANGED="YES"
fi
#Set a default PBI_PROGAUTHOR entry if an email address currently entered
if [ -n `echo ${PBI_PROGAUTHOR} | grep @` ]; then
  echo "Change the PBI_PROGAUTHOR entry: setting default author: ${i}"
  sed -i.bak "s,PBI_PROGAUTHOR=\"${PBI_PROGAUTHOR}\",PBI_PROGAUTHOR=\"${PBI_PROGNAME} Team\",g" ${i}
  CHANGED="YES"
fi

if [ ${CHANGED} == "YES" ]; then
  #bump the build key and prep for commit
  sed -i.bak "s,PBI_BUILDKEY=\"${PBI_BUILDKEY}\",PBI_BUILDKEY=\"`expr ${PBI_BUILDKEY} + 1`\",g" ${i}
  git add ${i}
fi
#end of the loop over pbi.conf's
done
