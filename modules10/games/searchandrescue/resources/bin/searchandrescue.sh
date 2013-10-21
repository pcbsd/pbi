#!/bin/sh

PROGDIR=CHANGEME

#Set the alternate data directory
SEARCHANDRESCUE_DATA="${PROGDIR}/share/searchandrescue"
export SEARCHANDRESCUE_DATA

#Run the program
SearchAndRescue $@
