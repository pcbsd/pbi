#!/bin/sh

#unload the additional arduino driver
echo "Unloading the uarduno kernel module..."
kldunload uarduno
rm /boot/modules/uarduno.ko

#Now remove this driver from loader.conf
cp /boot/loader.conf /boot/loader.conf.orig
cat /boot/loader.conf | grep -v "uarduno_load" > /tmp/loader.conf
mv /tmp/loader.conf /boot/loader.conf
