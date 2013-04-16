#!/bin/sh

# Better detection in case host isn't same as chroot
FBSDVER=`file /bin/sh | cut -d "," -f 5 | awk '{print $3}'`
#FBSDVER=`uname -r | cut -d '-' -f 1`

# Copy over the virtualbox X.0 modules we need
cp -R /boot/modules ${PBI_PROGDIRPATH}/modules$FBSDVER

# Install subversion
cd /usr/ports/devel/subversion && make install

# We can add other releases here eventually, like 9.2
case $FBSDVER in
  9.0) bREL="releng/9.1" ;;
  10.0) bREL="" ;;
  *) bREL="releng/9.1" ;;
esac

# Now the tricky part, we need to rebuild -kmod with sources from 9.1
for relpath in $bREL
do
  rel=`echo $relpath | cut -d '/' -f 2`
  rm -rf /usr/src
  mkdir /usr/src
  cd /usr/src
  echo "Checking out ${relpath}...."
  /usr/local/bin/svn co svn://svn.freebsd.org/base/${relpath} .
  if [ $? -ne 0 ] ; then echo "Failed getting FreeBSD sources..." exit 1 ; fi

  # Looks like we need updated buildworld as well
  cd /usr/src
  make buildworld installworld
  if [ $? -ne 0 ] ; then echo "Failed building FreeBSD sources..." exit 1 ; fi

  cd /usr/ports/emulators/virtualbox-ose-kmod
  make deinstall
  make clean 
  make
  make install
  if [ $? -ne 0 ] ; then echo "Failed building kmod..." exit 1 ; fi
  cp -R /boot/kernel/vboxdrv.ko ${PBI_PROGDIRPATH}/modules${rel}
  cp -R /boot/kernel/vboxnetadp.ko ${PBI_PROGDIRPATH}/modules${rel}
  cp -R /boot/kernel/vboxnetflt.ko ${PBI_PROGDIRPATH}/modules${rel}
done

# Remove built-in virtualbox desktop file
rm ${PBI_PROGDIRPATH}/share/applications/virtualbox.desktop
