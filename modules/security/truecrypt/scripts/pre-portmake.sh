#!/bin/sh

#cd /usr/ports/distfiles
#fetch http://www.pcbsd.org/~kris/TrueCrypt_7.1_Source.tar.gz
fetch -o /usr/pbi/src.tbz ftp://ftp.pcbsd.org/pub/mirror/9.0/`uname -m`/netinstall/extras/components/src.tbz
tar -xf /usr/pbi/src.tbz -C /usr/src 
rm -f /usr/pbi/src.tbz
