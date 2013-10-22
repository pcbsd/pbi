#!/bin/sh
#conversion script for converting a 9.x pbi.conf into a 10.x pbi.conf


createNewPbiConf() {
  #Syntax for the new pbi.conf file
  echo "#!/bin/sh
# PBI 10.x Build Configuration
 
# -- Program Base Information --
PBI_PROGNAME=\"${PBI_PROGNAME}\"
PBI_PROGWEB=\"${PBI_PROGWEB}\"
PBI_PROGAUTHOR=\"${PBI_PROGAUTHOR}\"
PBI_PROGICON=\"${PBI_PROGICON}\"

# -- Program Repo Information (optional) --
PBI_LICENSE=\"${PBI_LICENSE}\"
PBI_TAGS=\"${PBI_TAGS}\" #comma delimited (no spaces)
PBI_PROGTYPE=\"${PBI_PROGTYPE}\" #[Graphical/Text/Server]
PBI_ICONURL=\"${PBI_ICONURL}\" 
PBI_CATEGORY=\"${PBI_CATEGORY}\"
PBI_DESC=\"${PBI_DESC}\"
PBI_SHORTDESC=\"\"
 
# -- Port Information --
PBI_MAKEPORT=\"${PBI_MAKEPORT}\"
PBI_MKPORTBEFORE=\"${PBI_MKPORTBEFORE}\"
PBI_MKPORTAFTER=\"${PBI_MKPORTAFTER}\"
PBI_MAKEOPTS=\"${PBI_MAKEOPTS}\" #Disused for package/repo builds
 
# -- Require Root Permissions to Install PBI --
PBI_REQUIRESROOT=\"${PBI_REQUIRESROOT}\"
 
# -- Repo Configuration Options (optional) --
PBI_BUILDKEY=\"${PBI_BUILDKEY}\"
PBI_PROGREVISION=\"${PBI_PROGREVISION}\"
PBI_AB_PRIORITY=\"${PBI_AB_PRIORITY}\"
PBI_AB_NOTMPFS=\"${PBI_AB_NOTMPFS}\"
 
# -- Export all the required variables --
export PBI_PROGNAME PBI_PROGWEB PBI_PROGAUTHOR PBI_PROGICON PBI_MAKEPORT PBI_MKPORTBEFORE PBI_MKPORTAFTER PBI_MAKEOPTS PBI_REQUIRESROOT 
# -- Export all the optional variables --
export PBI_LICENSE PBI_TAGS PBI_PROGTYPE PBI_ICONURL PBI_CATEGORY PBI_DESC PBI_SHORTDESC PBI_BUILDKEY PBI_PROGREVISION PBI_AB_PRIORITY PBI_AB_NOTMPFS
" > ${NEWFILE}
}

readMetaFile() {
  APP=`echo ${PBI_PROGNAME} | tr -d '\040\011\012\015'`
  LINE=`grep -i "App=${APP}\;" ${METAFILE}`
  #echo "App: ${PBI_PROGNAME}  ${APP}"
  #echo "Line: ${LINE}"
  if [ -n "${LINE}" ]; then
  PBI_CATEGORY=`echo ${LINE} | cut -d ";" -f 2`
  PBI_ICONURL=`echo ${LINE} | cut -d ";" -f 3`
  PBI_LICENSE=`echo ${LINE} | cut -d ";" -f 6`
  PBI_PROGTYPE=`echo ${LINE} | cut -d ";" -f 7`
  PBI_TAGS=`echo ${LINE} | cut -d ";" -f 8`
  PBI_DESC=`echo ${LINE} | cut -d ";" -f 9`
  else
  PBI_CATEGORY=""
  PBI_ICONURL=""
  PBI_LICENSE=""
  PBI_PROGTYPE=""
  PBI_TAGS=""
  PBI_DESC=""
  fi
}

echo " -- Converting 9.x pbi.conf to 10.x pbi.conf -- "
METAFILE=`find ~ | grep pbi-meta-9`
echo "Meta File: ${METAFILE}"
for i in ${@}
do
  #Make sure it is only the pbi.conf file
  if [ ! `basename ${i}` == "pbi.conf" ] ; then
    continue
  fi
  echo "Converting: ${i}"
  #create the old/new paths
  OLDFILE="${i}"
  NEWFILE="${OLDFILE}.new"
  #set/reset variables
  PBI_MAKEOPTS=""
  PBI_MKPORTBEFORE=""
  PBI_MKPORTAFTER=""
  PBI_REQUIRESROOT="NO"
  PBI_BUILDKEY="00"
  PBI_AB_PRIORITY=""
  PBI_AB_NOTMPFS=""
  #Now read in the oldfile
  . ${i}
  #Now read the meta file
  if [ -n ${METAFILE} ] ; then readMetaFile; fi
  #Now write the new file
  createNewPbiConf
  #Now move the files around
  mv ${i} ${OLDFILE}.old
  mv ${NEWFILE} ${i}
done