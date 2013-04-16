#!/bin/sh

PROGDIR=CHANGEME

if [ ! -e ~/.echoLinux ] ; then
	mkdir ~/.echoLinux
	echo "server1.echolink.org" > ~/.echoLinux/servers.txt
fi
if [ ! -e ~/.echoLinux/userdata.txt ] ; then
kdialog --error "
You will need an userdata.txt file placed into
~/.echoLinux/userdata.txt
In this format:

N0CALL
YOURNAME
YOURLOCATION
YOURPASS

Please look at http://www.echolink.org
for more information on how to register.

You will also need to open your firewall.
Read chapter 6.3 of your PC-BSD Quick Guide and
add the following line to your /etc/pf.conf
pass in proto {tcp,udp} from any to any port 5198:5200

"
else
	/Programs/${PROGDIR}/bin/echogui
fi
exit 0
