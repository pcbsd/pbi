#!/bin/sh

#Fix the perl header for the main binary
sed -i.bak "s,/usr/bin/perl,${PBI_PROGDIRPATH}/bin/perl,w" ${PBI_PROGDIRPATH}/bin/xrdesktop
