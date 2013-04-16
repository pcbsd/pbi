#!/bin/sh

sed -i.bak "s,/sbin/bitlbee,/.sbin/bitlbee,g" ${PBI_PROGDIRPATH}/etc/rc.d/bitlbee
chmod 755 ${PBI_PROGDIRPATH}/bin/*
