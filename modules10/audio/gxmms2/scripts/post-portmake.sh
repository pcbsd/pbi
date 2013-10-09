#!/bin/sh

sed -i.bak "s,CHANGEME,${PBI_TARGETDIR},g" ${PBI_PROGDIRPATH}/bin/xmms2-admin.sh 
chmod 755 ${PBI_PROGDIRPATH}/bin/xmms2-admin.sh
