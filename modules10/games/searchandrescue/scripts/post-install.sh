#!/bin/sh

#ln -s ${PBI_PROGDIRPATH}/share/searchandrescue /usr/local/share/searchandrescue

sed -i.bak "s,CHANGEME,${PBI_PROGDIRPATH},g" ${PBI_PROGDIRPATH}/bin/searchandrescue.sh
chmod 755 ${PBI_PROGDIRPATH}/bin/searchandrescue.sh

