#!/bin/sh
PREFIX=/usr/pbi/wine-amd64

# Run the nvidia setup / detection script
echo "Running patch-nvidia.sh"
sh ${PREFIX}/share/wine/patch-nvidia.sh
echo "Done with post-install script"
