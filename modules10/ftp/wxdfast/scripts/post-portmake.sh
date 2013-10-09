#!/bin/sh

sed -i.bak "s,CHANGE,${PBI_TARGETDIR},g" ${PBI_PROGDIRPATH}/bin/wxdfast.sh
chmod 755 ${PBI_PROGDIRPATH}/bin/wxdfast.sh
