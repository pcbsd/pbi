#!/bin/sh

PROG="geoid"
PROGL="GEOID"
BINARY="/usr/local/bin/geoid"

if [ -e ${BINARY} ]
then
    # Looks like ${PROG} is installed, ask if they want to remove the old one
    ls -al ${BINARY} | grep Programs 2>/dev/null
    if [ "$?" = "0" ]
    then
      if [ "$?" = "0" ]
      then
        TODEL="`ls -al ${BINARY} | cut -d '>' -f 2 | cut -d "/" -f 3`"
        echo ${TODEL} | grep ${PROG}
        if [ "$?" = "0" ]
        then
          PBIdelete -remove ${TODEL}
        else
          return 2
        fi
      else
        return 2
      fi
      
    else
      # Could not find a link to PBI folder
      return 2
    fi
fi
