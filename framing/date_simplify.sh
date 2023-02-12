#!/bin/bash
# Credit: unix.stackexchange.com/a/98299
#
# $ bash % 2003-10-22 -

## cmdline argument is e.g. "2003-10-22" and "-"
## cmdline argument is e.g. "2003:10:22" and ":"
DATE=$1; shift
SEP=$1; shift


### extract day, month and year into separate variables
MONTHDAY=${DATE#*${SEP}}

YEAR=${DATE%%${SEP}*}
MONTH=${MONTHDAY%%${SEP}*}
DAY=${MONTHDAY#*${SEP}}

# an array to look up th month-names
# since month-numbers start with 1, the first element in the array is invalid.
monthnames=(invalid JAN FEB MAR APR MAÍ JÚN JÚL ÁGU SEP OKT NÓV DES)

## perform the lookup
MONTHNAME=${monthnames[${MONTH}]}

## display "<Month> <DAY>"
echo -n ${DAY} ${MONTHNAME} ${YEAR}
