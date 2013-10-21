#!/bin/sh
INSTALLED=`ls /Programs | grep BomberClone`
if [ $? = 0 ]
then
	exit 2
fi

