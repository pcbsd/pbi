#!/bin/sh
chmod -fR 775 ${PBI_PROGDIRPATH}/lib/abyssws
echo 'MSG: Installing lang packages'
respuesta=$?
if [ "$respuesta" = "0" ]; then
echo 'MSG: Detecting network'
isalive=`ping -c2 www.aprelium.com >/dev/null && echo up || echo down;` 
	if [ "$isalive" = "down" ]; then
	else
	echo 'MSG: Network OK'
	cd ${PBI_PROGDIRPATH}/lib/abyssws/lang/
	echo 'MSG: Downloading ar.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/ar.lng
	echo 'MSG: Downloading bg.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/bg.lng
	echo 'MSG: Downloading cz.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/cz.lng
	echo 'MSG: Downloading de.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/de.lng
	echo 'MSG: Downloading es.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/es.lng
	echo 'MSG: Downloading fr.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/fr.lng
	echo 'MSG: Downloading gr.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/gr.lng
	echo 'MSG: Downloading hr.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/hr.lng
	echo 'MSG: Downloading hu.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/hu.lng
	echo 'MSG: Downloading id.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/id.lng
	echo 'MSG: Downloading it.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/it.lng
	echo 'MSG: Downloading jp.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/jp.lng
	echo 'MSG: Downloading mk.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/mk.lng
	echo 'MSG: Downloading ms.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/ms.lng
	echo 'MSG: Downloading nl.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/nl.lng
	echo 'MSG: Downloading no.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/no.lng
	echo 'MSG: Downloading nn-no.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/nn-no.lng
	echo 'MSG: Downloading pl.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/pl.lng
	echo 'MSG: Downloading pt.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/pt.lng
	echo 'MSG: Downloading pt-br.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/pt-br.lng
	echo 'MSG: Downloading ru.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/ru.lng
	echo 'MSG: Downloading sl.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/sl.lng
	echo 'MSG: Downloading sv.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/sv.lng
	echo 'MSG: Downloading tr.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/tr.lng
	echo 'MSG: Downloading zh-cn.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/zh-cn.lng
	echo 'MSG: Downloading zh-tw.lng...'
	fetch http://www.aprelium.com/abyssws/languages/a/zh-tw.lng
	fi
fi

if [ "$respuesta" = "1" ]; then
fi

cp /usr/lib/libz.so ${PBI_PROGDIRPATH}/lib/libz.so.3
sed -i.bak "s,CHANGEME,${PBI_PROGDIRPATH},g" ${PBI_PROGDIRPATH}/bin/abyssws-start
chmod 755 ${PBI_PROGDIRPATH}/bin/*
