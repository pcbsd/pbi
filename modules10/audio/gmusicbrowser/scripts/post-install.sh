#!/bin.sh

sed -i.bak "s,/usr/bin/perl,${PBI_PROGDIRPATH}/bin/perl,g" ${PBI_PROGDIRPATH}/bin/gmusicbrowser
