#!/bin/sh

if [ ! -e "/Programs/share/doom3/base" ]
then
  mkdir -p /Programs/share/doom3/base
fi

cp ${PBI_PROGDIRPATH}/lib/linux-doom3/base/* /Programs/share/doom3/base/
chmod 777 /Programs/share/doom3/base

rm -rf ${PBI_PROGDIRPATH}/lib/linux-doom3/base
ln -s /Programs/share/doom3/base ${PBI_PROGDIRPATH}/lib/linux-doom3/base

