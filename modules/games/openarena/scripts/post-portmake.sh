#!/bin/sh

#Fix the versioning for this PBI (port DISTVERSION is not correct)

PORTSDIR=${PORTSDIR:=/pbibuild64/ports} #Make sure the PORTSDIR is set
export PBI_PROGVERSION=`make -C ${PORTSDIR}/games/openarena -V PORTVERSION`
