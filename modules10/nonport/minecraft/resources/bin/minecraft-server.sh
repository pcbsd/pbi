#!/bin/sh
PROGDIR=/usr/local
export JAVA_HOME=${PROGDIR}/openjdk6

#Start minecraft-server
java -Xmx1024M -Xms1024M -jar ${PROGDIR}/minecraft_server.jar
