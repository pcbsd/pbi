#!/bin/sh
# XMMS2 Manager utility
# Author: Kris Moore (PC-BSD Software)
# License: BSD
############################################################################

PROGDIR=CHANGEME

mkdir -p ~/.config/xmms2 2>/dev/null

# Function to start xmms2d in the background
start_xmms2d() {
  echo -e "Starting xmms2d...\c"
  ( /Programs/bin/xmms2d 2>/dev/null ) &
  sleep 2
  echo -e "Done!"
};

# Function to stop xmms2d in the background
stop_xmms2d() {
  echo -e "Stopping xmms2d...\c"
  xmms2 quit
  sleep 2
  echo -e "Done!"
};

# Function enable startup of xmms2d in the background
enable_xmms2d() {
  ln -s /Programs/bin/xmms2d ~/.kde4/Autostart/xmms2d
};

# Function disable startup of xmms2d in the background
disable_xmms2d() {
  rm ~/.kde4/Autostart/xmms2d
};

# Display help about this manager
display_help() {
clear
echo "
This manager allows you to start and stop the xmms2 daemon on your system. This
daemon is required to play sound using an xmms2 client, such as gxmms2.

You may also enable startup of the xmms2 daemon at login.

The xmms2 interface is command-line only. To use a GUI controller, please
install gxmms2 or another client from www.pbidir.com. 

Press ENTER to continue
"
read tmp
};

while
h=1
do

# Check if xmms2d is running
ps -auwx | grep -v "grep" | grep "xmms2d"
if [ "$?" = "0" ]
then
  RUNOPT="stop"
  RUNMSG="Stop xmms2d service"
else
  RUNOPT="start"
  RUNMSG="Start xmms2d service"

fi

ls ~/.kde4/Autostart/xmms2d >/dev/null 2>/dev/null
if [ "$?" = "0" ]
then
  ENABLEOPT="disable"
  ENABLEMSG="Disable xmms2d autostart"
else
  ENABLEOPT="enable"
  ENABLEMSG="Enable xmms2d autostart"
fi


dialog --title "xmms2 manager" --menu "Please select an option:" 15 60 10 $RUNOPT "$RUNMSG" $ENABLEOPT "$ENABLEMSG" help "Display help file" exit "Exit" 2>~/.config/xmms2/ans
ANS=`cat ~/.config/xmms2/ans`
rm ~/.config/xmms2/ans
case $ANS in
    start) start_xmms2d ;;
     stop) stop_xmms2d ;;
   enable) enable_xmms2d ;;
  disable) disable_xmms2d ;;
  help) display_help ;;
     exit) exit 0 ;;
        *) ;;
esac




done

