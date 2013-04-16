#!/bin/sh

cd ${PBI_PROGDIRPATH}/libexec
for x in `find emacs -type f` 
do
  ln -s $x `basename $x`
done


