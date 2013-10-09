#!/bin/sh

sed -i.bak "s,/usr/local,${PBI_TARGETFULLDIR},g" ${PBI_PROGDIRPATH}/bin/last.fm
chmod 755 ${PBI_PROGDIRPATH}/bin/last.fm
