#!/bin/sh

#load the additional driver for arduino devices
ln -s ${PBI_PROGDIRPATH}/kmod/uarduno.ko /boot/modules/uarduno.ko
echo "Loading the uarduno kernel module"
kldload uarduno

#Now add this driver to loader.conf so it will be loaded on startup
cp /boot/loader.conf /boot/loader.conf.orig
cat /boot/loader.conf | grep -v "uarduno_load" > /tmp/loader.conf
echo 'uarduno_load="YES"' >> /tmp/loader.conf
mv /tmp/loader.conf /boot/loader.conf
