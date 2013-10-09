#!/bin/sh

sed -i.bak "s,/usr/bin,${PBI_TARGETFULLDIR}/bin,g" ${PBI_PROGDIRPATH}/share/amsn/amsn-remote

sed -i.bak "s,/usr/bin,${PBI_TARGETFULLDIR}/bin,g" ${PBI_PROGDIRPATH}/share/amsn/amsn-remote-CLI

chmod 755 ${PBI_PROGDIRPATH}/bin/*
