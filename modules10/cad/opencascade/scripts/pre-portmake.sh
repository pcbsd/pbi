#!/bin/sh

cd /usr/ports/distfiles

fetch ftp://ftp.pcbsd.org/pub/autobuildpkgs/javapack.tbz
tar xvjf javapack.tbz

cd /usr/ports/java/jdk16/
echo "#!/bin/sh
exit 0" > /usr/ports/java/jdk16/files/license.sh
