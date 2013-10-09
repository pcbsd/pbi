#!/bin/sh

#Make the sym-links without the openoffice version in the name
cd ${PBI_PROGDIRPATH}/bin
ln -s open*sbase sbase
ln -s open*scalc scalc
ln -s open*sdraw sdraw
ln -s open*setofficelang setofficelang
ln -s open*simpress simpress
ln -s open*smath smath
ln -s open*spadmin spadmin
ln -s open*swriter swriter
ln -s sbase soffice
