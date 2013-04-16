#!/bin/sh

sysctl hw.snd.compat_linux_mmap=1

cat /etc/sysctl.conf | grep "hw.snd.compat_linux_mmap=1" >/dev/null 2>/dev/null
if [ "$?" != "0" ]
the
  echo "hw.snd.compat_linux_mmap=1" >> /etc/sysctl.conf
fi

