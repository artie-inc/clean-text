#!/bin/bash

# Lowercase all text
# remove all characters which are not a-z or 0-9 or space or newline
# remove brackets (needed for some reason?)
# trim leading and trailing whitespace
# remove all duplicate lines
# remove long strings of chars with no spaces
# remove all lines 10 characters and shorter
# sort from short to long

cat $1 \
    | tr '[:upper:]' '[:lower:]' \
    | tr -cd '[a-z0-9] \n' \
    | sed 's/ \+/ /g' \
    | sed 's/\[//g' | sed 's/\]//g' \
    | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' \
    | sort \
    | uniq \
    | grep -v -E "[[:alpha:]]{50}" \
    | grep -v -E "^.{1,10}$" \
    | awk '{print length,$0}' | sort -n | awk ' {$1="";print $0}' | cut -f2- -d' '
