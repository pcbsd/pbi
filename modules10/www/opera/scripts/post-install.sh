#!/bin/sh

cd ${PBI_PROGDIRPATH}

cd extra-langs
mv *.lng ${PBI_PROGDIRPATH}/share/opera/locale/

sed -i.bak 's|done|done ; unset LD_LIBRARY_PATH|g' ${PBI_PROGDIRPATH}/lib/opera/pluginwrapper/operapluginwrapper

#if [ -d "/PCBSD/local/etc/fonts" ]
#then
  # Fix the plugin search paths
  #sed -i.bak "s|/usr/local|/usr/PCBSD/local|g" \ ${PBI_PROGDIRPATH}/share/opera/defaults/pluginpath.ini
#fi

#rm ${PBI_PROGDIRPATH}/${PBI_FAKEBINDIR}/opera
#ln -s ${PBI_PROGDIRPATH}/bin/opera ${PBI_PROGDIRPATH}/${PBI_FAKEBINDIR}/opera

