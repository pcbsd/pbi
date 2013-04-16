#!/bin/sh

# Fix compiling on 9.0-32bit
cd /usr/lib
ln -s libc.so libc.so.6

# Set a PATH to fix some build issues on i386
echo '
VER="`make -C /usr/ports/emulators/virtualbox-ose -V DISTVERSION`"
if [ `uname -m` = "i386" ] ; then
  PATH="/usr/wrkdirprefix/usr/ports/emulators/virtualbox-ose/work/VirtualBox-${VER}/tools/freebsd.x86/bin:${PATH}"
  export PATH
fi' >> /pre-build.sh
chmod 755 /pre-build.sh
