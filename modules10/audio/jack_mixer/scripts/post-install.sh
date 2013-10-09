#!/bin/sh

sed -i.bak "s,/usr/bin/env python,${PBI_PROGDIRPATH}/bin/python,g" ${PBI_PROGDIRPATH}/bin/jack_mixer

