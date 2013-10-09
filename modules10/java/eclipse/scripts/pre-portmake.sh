#!/bin/sh

cd /usr/ports/distfiles

fetch ftp://ftp.pcbsd.org/pub/autobuildpkgs/javapack.tbz
tar xvjf javapack.tbz

# Fetch eclipse files
rm /usr/ports/distfiles/eclipse/*
cd /usr/ports/java/eclipse
make fetch
