#!/bin/sh

sed -i.bak "s,CHANGEME,${PBI_TARGETFULLDIR},g" ${PBI_PROGDIRPATH}/bin/spring.sh
chmod 755 ${PBI_PROGDIRPATH}/bin/*
