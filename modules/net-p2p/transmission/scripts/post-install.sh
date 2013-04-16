#!/bin/sh


sed -i.bak '/^transmission_*/d' /etc/rc.conf

ln -s ${PBI_PROGDIRPATH}/etc/rc.d/transmission ${PBI_RCDIR}/transmission
echo "transmission_enable=\"YES\"
transmission_watch_dir=\"${PBI_PROGDIRPATH}/share/transmission/AutoTorrents\"
transmission_conf_dir=\"${PBI_PRODGIRPATH}/share/transmission/etc\"
transmission_download_dir=\"${PBI_PROGDIRPATH}/share/transmission/home/Downloads\"
" >> /etc/rc.conf


USER=transmission
GROUP=${USER}
CHMOD=/bin/chmod
CHOWN=/usr/sbin/chown
MKDIR=/bin/mkdir
THOME=${PBI_PROGDIRPATH}/share/${USER}/home

${MKDIR} -p ${THOME}/Downloads
${MKDIR} -p ${THOME}/AutoTorrents
${MKDIR} -p ${THOME}/etc
${CHOWN} root:${GROUP} ${THOME}
${CHOWN} ${USER}:${GROUP} ${THOME}/Downloads
${CHOWN} ${USER}:${GROUP} ${THOME}/etc
${CHOWN} ${USER}:${GROUP} ${THOME}/AutoTorrents
${CHMOD} 1770 ${THOME}


${PBI_RCDIR}/transmission start
