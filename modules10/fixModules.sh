#!/bin/sh

#quick script to search for and fix all the pbi.conf's it is given
for i in $@
do
if [ ! "`basename ${i}`" == "pbi.conf" ]; then 
  continue
fi

#Run the pbi.conf to set the variables
. ${i}
#Remove trailing "/" from PBI_MAKEPORT
if [ ${PBI_MAKEPORT} != ${PBI_MAKEPORT%/} ]; then
  echo "Fixing Trailing / in PBI_MAKEPORT: ${i}"
  sed -i.bak "s,PBI_MAKEPORT=\"${PBI_MAKEPORT}\",PBI_MAKEPORT=\"${PBI_MAKEPORT%/}\",g" ${i}
  sed -i.bak "s,PBI_BUILDKEY=\"${PBI_BUILDKEY}\",PBI_BUILDKEY=\"`expr ${PBI_BUILDKEY} + 1`\",g" ${i}
  git add ${i}
fi

#end of the loop over pbi.conf's
done
