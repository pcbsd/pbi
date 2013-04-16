#!/bin/sh

# Make thunderbird a sym-link
cd ${PBI_PROGDIRPATH}/bin
rm thunderbird
ln -s ${PBI_PROGDIRPATH}/lib/thunderbird/thunderbird ${PBI_PROGDIRPATH}/bin/thunderbird

