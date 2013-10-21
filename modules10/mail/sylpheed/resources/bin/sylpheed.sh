#!/bin/sh
# Wrapper script for Sylpheed to ensure G_FILENAME_ENCODING is set properly
#############################################################################

PROGDIR=CHANGEME

G_FILENAME_ENCODING="@locale" ; export G_FILENAME_ENCODING

${PROGDIR}/bin/sylpheed "$@"
