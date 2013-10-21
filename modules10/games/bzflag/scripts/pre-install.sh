#!/bin/sh


if [ -e "/usr/local/bin/bzflag" ]
then
    # Looks like FF is installed, ask if they want to remove the old one
    ls -al /usr/local/bin/bzflag | grep Programs 2>/dev/null
    if [ "$?" = "0" ]
    then
      if [ "$?" = "0" ]
      then
        FF="`ls -al /usr/local/bin/bzflag | cut -d '>' -f 2 | cut -d "/" -f 3`"
        echo $FF | grep BZFlag 2>/dev/null
        if [ "$?" = "0" ]
        then
          PBIdelete -remove ${FF}
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
