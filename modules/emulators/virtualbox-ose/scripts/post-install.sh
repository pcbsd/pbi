#!/bin/sh

# Copy over the modules specific to this release
#FBSDVER=`uname -r | cut -d '-' -f 1`
#cp ${PBI_PROGDIRPATH}/modules${FBSDVER}/* /boot/modules/
cp ${PBI_PROGDIRPATH}/modules*/* /boot/modules/

cp /boot/loader.conf /boot/loader.conf.orig
cat /boot/loader.conf | grep -v "vboxdrv_load"  > /tmp/loader.conf
echo 'vboxdrv_load="YES"' >> /tmp/loader.conf
mv /tmp/loader.conf /boot/loader.conf

sed -i.bak "s,CHANGEME,${PBI_PROGDIRPATH},g" ${PBI_PROGDIRPATH}/bin/VirtualBox-wrapper 
chmod 755 ${PBI_PROGDIRPATH}/bin/VirtualBox-wrapper 
rm ${PBI_PROGDIRPATH}/bin/VirtualBox-wrapper.bak 

ln -fs ${PBI_PROGDIRPATH}/etc/rc.d/vboxnet /usr/local/etc/rc.d/vboxnet

grep '^vboxnet_enable="YES"' /etc/rc.conf >/dev/null 2>/dev/null
if [ "$?" != "0" ] ; then
  echo "vboxnet_enable=\"YES\"" >> /etc/rc.conf
fi
/usr/local/etc/rc.d/vboxnet start

# To fix a security issue with VB complaining about invalid root permissions
chown root:wheel ${PBI_PROGDIRPATH}
