#!/bin/sh

sed -i.bak "s,CHANGEME,${PBI_TARGETDIR},g" ${PBI_PROGDIRPATH}/bin/echolink.sh
