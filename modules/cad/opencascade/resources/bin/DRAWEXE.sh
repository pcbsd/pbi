#!/bin/sh
# OpenCascade Helper Script

PROGDIR=CHANGEME

LD_LIBRARY_PATH="${LD_LIBRARY_PATH}"
export LD_LIBRARY_PATH

CASROOT="${PROGDIR}/OpenCAS/ros"
export CASROOT

# Run DrawEXE now
${PROGDIR}/bin/DRAWEXE $@

