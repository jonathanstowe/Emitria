#!/usr/bin/env bash
############################################
# just a wrapper to call the notifyer      #
# needed here to keep dirs/configs clean   #
# and maybe to set user-rights             #
############################################

# Absolute path to this script
SCRIPT=`realpath $0`
# Absolute path this script is in
SCRIPTPATH=`dirname $SCRIPT`

cd ${SCRIPTPATH}/../ 
gtimeout 45 python pyponotify.py "$@"
