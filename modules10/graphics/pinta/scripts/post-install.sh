#!/bin/sh

#Fix the mono binary location
sed -i.bak "s,/usr/local/bin,${PBI_PROGDIRPATH}/bin,g" ${PBI_PROGDIRPATH}/bin/pinta
