#!/bin/sh

#Setup some internal script variables
PROGDIR=`pwd | cut -d / -f 1-4`   #Base PBI directory (/usr/pbi/myapplication-<arch>)
APPBINARY=bin/arduino   #application binary

#Set the java home path properly
cd ${PROGDIR}
JDKDIR=`ls | grep openjdk`
export JAVA_HOME=${PROGDIR}/${JDKDIR}

#Now start the main application
${PROGDIR}/${APPBINARY} $@
