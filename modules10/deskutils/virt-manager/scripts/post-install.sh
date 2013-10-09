#!/bin/sh

sed -i.bak "s,/usr/bin/python,${PBI_PROGDIRPATH}/bin/python,g" ${PBI_PROGDIRPATH}/bin/virt-manager
