#!/bin/sh

cd ${PBI_PROGDIRPATH}

USERS="`cut -d ':' -f 1 /etc/passwd | grep -v '^#'`" 
for i in ${USERS}  
do 
  HOMEDIR="`cat /etc/passwd | grep ^${i}: | cut -d ":" -f 6`" 
  if [ -e "${HOMEDIR}/.purple/prefs.xml" ]
  then
    su $i -c ${PBI_PROGDIRPATH}/fixprefs.sh ${PBI_PROGDIRPATH}
  fi
done


