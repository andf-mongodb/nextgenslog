#!/bin/sh

## HOW TO USE
##
## Start with purge.sh
##
## Then, call this script and pass your (now-purged)
## filename as the only parameter. Ex:
##
## ./sort.sh MYOUTPUTFILE
##
## This script takes your giant log output and:
##
## - Sorts into two files: warnings and errors
## - Simplifies log messages to be more readable
## - Sorts the output based on error message first,
##     not file location, making it easy to work on
##     one issue all together
## - Outputs each sorted file with a timestamp and
##     current count of warnings | errors, so you
##     can sorta keep tabs on your progress. Also
##     prevents overwriting your output files later,
##     if, say, you do this process a lot in a day.


TIMESTAMP=`date +%Y%m%d_%H:%M:%S`

WARNINGS=0
ERRORS=0

PARSETHIS=$1

IFS="
"

for line in `cat $PARSETHIS`; do
    if [ `echo $line | egrep -c ^WARNING` -gt 0 ]; then
        echo $line | sed 's%^WARNING(%%g' | awk -F '\\\): ' '{print $2,"|",$1}' >> warnings 
        (( WARNINGS++ ))
    elif [ `echo $line | egrep -c ^ERROR` -gt 0 ]; then
        echo $line | sed 's%^ERROR(%%g' | awk -F '\\\): ' '{print $2,"|",$1}' >> errors
        (( ERRORS++ ))
    else
        echo $line >> unknown
    fi
done

cat warnings 2>/dev/null | sort -k1 > warnings.sorted
cat errors 2>/dev/null | sort -k1 > errors.sorted

mv warnings.sorted $TIMESTAMP-warnings-$WARNINGS 2>/dev/null
mv errors.sorted $TIMESTAMP-errors-$ERRORS 2>/dev/null

rm -f warnings 2>/dev/null
rm -f errors 2>/dev/null
