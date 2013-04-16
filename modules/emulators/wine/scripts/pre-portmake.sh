#!/bin/sh

cd /usr/ports/print/freetype2
make install clean

cd /usr/ports/x11/xorg
make clean
make install

cd /usr/ports/sysutils/hal
make clean
make
make install

cd /usr/ports/graphics/sane-backends
make install clean

cd /usr/ports/graphics/libgphoto2
make install clean

cd /usr/ports/graphics/lcms
make install clean

cd /usr/ports/net/openldap24-client
make install clean

cd /usr/ports/print/cups
make install clean

cd /usr/ports/graphics/png
make install clean

cd /usr/ports/graphics/jpeg
make install clean

cd /usr/ports/x11-fonts/liberation-fonts-ttf/
make install clean

cd /usr/ports/x11-fonts/dejavu
make install clean
