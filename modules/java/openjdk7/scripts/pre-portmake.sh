#!/bin/sh

cd /usr/ports/distfiles

echo "Fetching javapack.tbz"
fetch ftp://ftp.pcbsd.org/pub/autobuildpkgs/javapack.tbz
tar xvjf javapack.tbz

echo "Modifying the java/icedtea-web Makefile to use OpenJDK7"
sed -i.bak "s,JAVA_VERSION=	1.6+,JAVA_VERSION=	1.7+,g" /usr/ports/java/icedtea-web/Makefile
echo "Done: now java version is: `cat /usr/ports/java/icedtea-web/Makefile | grep JAVA_VERSION` "
