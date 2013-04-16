#!/bin/sh

for i in `ls ${PBI_PROGDIRPATH}/lib/*.so.5`
do
  j=${i%%.so.5}
  ln -s $i ${j}.5.so
done