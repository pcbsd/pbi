#!/bin/sh

sed -i.bak "s,CHANGEME,${PBI_PROGDIRPATH},g" ${PBI_PROGDIRPATH}/bin/sylpheed.sh

chmod 755 ${PBI_PROGDIRPATH}/bin/*
