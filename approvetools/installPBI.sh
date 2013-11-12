#!/bin/sh

for i in $@
do
  #Check that it is a PBI
  if [ `basename ${i} .pbi` ==  `basename ${i}`  ]; then
    continue
  fi
  #Load the PBI information
  NEEDROOT=`pbi_add -i ${i} | grep "RootInstall: YES"`
  PBIPATH=`pbi_add -i ${i} | grep "Prefix:" | cut -d : -f 2`
  #Install the PBI
  if [ -n "${NEEDROOT}" ] && [ -e ${PBIPATH} ]; then
    echo "Re-install ${i} as ROOT"
    sudo pbi_add -f ${i}
  elif [ -n "${NEEDROOT}" ]; then
    echo "Install ${i} as ROOT"
    sudo pbi_add ${i}
  elif [ -e ${PBIPATH} ]; then
    echo "Re-install ${i}"
    pbi_add -f ${i}
  else
    echo "Install ${i}"
    pbi_add ${i}
  fi
  #Check for success
  if [ -e ${PBIPATH} ]; then
    echo "--Success--"
    rm ${i}
  else
    echo "--FAILURE--"
  fi
  echo ""
done

