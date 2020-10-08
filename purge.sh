#!/bin/sh

## HOW TO USE:
##
## Copy your giant list of ERRORS and WARNINGS from the
## Autobuilder weblog output into a new file in the
## same directory as this script. Call this script
## and pass your filename as the only parameter. Ex:
##
## ./purge.sh MYOUTPUTFILE
##
## This script will remove any ERRORS or WARNINGS
## that are already logged in either of the following
## files, also in this same directory:
##
## - MUST_SUPPORT -- a list of errors I belive are DOP's
##                   responsibility to fix
## - WE_FIX       -- a list of errors that I'm pretty
##                   sure are on us to sort out, and
##                   aren't necessarily quick fixes
##
## NOTE: Running this script will overwrite your log
## output file with a purged version.
##
## After running this, run sort.sh, details there.


PURGETHIS=$1

grep -vFf MUST_SUPPORT $PURGETHIS > $PURGETHIS.purged1
grep -vFf WE_FIX $PURGETHIS.purged1 > $PURGETHIS

rm -f $PURGETHIS.purged1
