#!/bin/bash

# remove lines which have numbers and letters together, because
# num2words can't handle them (another option would be to insert whitespace)

cat $1 \
    | grep -v -i '[a-z][0-9]' \
    | grep -v -i '[0-9][a-z]'
