#!/bin/sh

sed -i.bak "s,/usr/local/share,${PBI_PROGDIRPATH}/share,g" ${PBI_PROGDIRPATH}/bin/tunapie
