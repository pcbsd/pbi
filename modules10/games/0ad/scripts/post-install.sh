#!/bin/sh

#Fix the binary directory location
sed -i.bak "s,/usr/local/bin,${PBI_PROGDIRPATH}/bin,g" ${PBI_PROGDIRPATH}/bin/0ad
