#!/bin/sh
PROGDIR=/usr/local
LIBDIR=${PROGDIR}/lib/lwjgl2.7.1
JARDIR=${PROGDIR}/share/java/classes
USERMINEDIR=~/.minecraft

export JAVA_HOME=${PROGDIR}/openjdk6

#Check if the libs within the user's .minecraft folder have been fixed yet
if [ -d $USERMINEDIR ]; then

      echo "Replacing the LWJGL libraries"
      if [ ! -d ${USERMINEDIR}/bin ]; then 
        mkdir ${USERMINEDIR}/bin
      fi
      if [ ! -d ${USERMINEDIR}/bin/natives ]; then
        mkdir ${USERMINEDIR}/bin/natives
      fi

      cd ${USERMINEDIR}/bin
      #ln -s ${PROGDIR}/minecraft.jar minecraft.jar
      #rm *.jar*
      if [ -f ${JARDIR}/lwjgl/lwjgl.jar ]; then
        cp ${JARDIR}/lwjgl/lwjgl.jar lwjgl.jar         
      fi
      if [ -f ${JARDIR}/lwjgl/lwjgl_util.jar ]; then 
        cp ${JARDIR}/lwjgl/lwjgl_util.jar lwjgl_util.jar
      fi
      if [ -f {JARDIR}/jinput/jinput.jar ]; then
        cp ${JARDIR}/jinput/jinput.jar jinput.jar
      fi
      cd natives/
      #rm *.so
      if [ -f ${LIBDIR}/liblwjgl.so ]; then
        cp ${LIBDIR}/liblwjgl.so liblwjgl.so
        chmod 666 liblwjgl.so
      else
        cp ${LIBDIR}/liblwjgl64.so liblwjgl64.so
        chmod 666 liblwjgl64.so
      fi

      echo "Finished linking to FreeBSD libraries"
else
   zenity --info --text="Minecraft will need to be restarted once all the libraries have been initially downloaded in order to replace LWJGL with the FreeBSD-compiled version."
fi

#Start minecraft
${PROGDIR}/bin/java -Dos.name=Linux -Xmx1024M -Xms512M -Djava.net.preferIPv4Stack=true -cp ${PROGDIR}/minecraft.jar net.minecraft.LauncherFrame
