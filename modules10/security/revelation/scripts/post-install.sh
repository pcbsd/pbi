#!/bin/sh

#Fix the python header
sed -i.bak "s,/usr/local/bin/env python,${PBI_PROGDIRPATH},g" ${PBI_PROGDIRPATH}/bin/revelation
