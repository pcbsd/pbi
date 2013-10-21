#!/bin/sh

glxinfo | grep "direct rendering:" | grep " Yes" 2>/dev/null
if [ "$?" != "0" ]
then
fi
