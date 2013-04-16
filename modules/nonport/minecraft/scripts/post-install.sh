#!/bin/sh

sed -i.bak "s,CHANGEME,${PBI_PROGDIRPATH},g" ${PBI_PROGDIRPATH}/bin/minecraft.sh
sed -i.bak "s,CHANGEME,${PBI_PROGDIRPATH},g" ${PBI_PROGDIRPATH}/bin/minecraft-server.sh

#Fix the wrapper script permissions
cd ${PBI_PROGDIRPATH}/bin
chmod 755 minecraft.sh
chmod 755 minecraft-server.sh
