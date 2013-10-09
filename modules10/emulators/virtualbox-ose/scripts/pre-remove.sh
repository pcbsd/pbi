#!/bin/sh

kldunload vboxdrv
kldunload vboxnetadp
kldunload vboxnetflt
rm /boot/modules/vboxdrv.ko
rm /boot/modules/vboxnetadp.ko
rm /boot/modules/vboxnetflt.ko

cat /boot/loader.conf | grep -v "^vbox" > /tmp/loader.conf
mv /tmp/loader.conf /boot/loader.conf

rm /usr/local/etc/rc.d/vboxnet
