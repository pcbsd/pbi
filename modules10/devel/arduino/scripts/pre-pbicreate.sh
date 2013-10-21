#!/bin/sh

#Adjust the default preferences to reflect the differences for FreeBSD
cd ${PBI_PROGDIRPATH}
PREFS_FILE=${PBI_PROGDIRPATH}/`find . | grep preferences.txt | cut -d / -f 2-8`

#default serial device for FreeBSD (COM1 does not exist)
sed -i.bak "s,serial.port=COM1,serial.port=cuaU0,g" ${PREFS_FILE}

#setup the web-browser launcher
echo "launcher=/usr/local/bin/openwith" >> ${PREFS_FILE}

#Now make sure the uarduno kernel module is copied into the PBI
mkdir ${PBI_PROGDIRPATH}/kmod
KMOD=`find /boot | grep -v kernel | grep uarduno.ko`
echo "Found uarduno.ko: ${KMOD}"
cp ${KMOD} ${PBI_PROGDIRPATH}/kmod/uarduno.ko
