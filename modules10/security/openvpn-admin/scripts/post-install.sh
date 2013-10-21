#!/bin/sh

sed -i.bak "s,/usr/local/bin/mono,${PBI_PROGDIRPATH}/bin/mono,g" ${PBI_PROGDIRPATH}/sbin/openvpn-admin
