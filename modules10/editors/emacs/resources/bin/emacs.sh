#!/bin/sh

PROGDIR=CHANGEME

#startup Emacs with flags to prevent it from crashing
dbus-launch --exit-with-session ${PROGDIR}/bin/emacs
