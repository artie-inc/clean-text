#!/bin/bash

# loop over each word in a file (defined by whitespace) and if it's
# actually a number with digits, use num2words to convert it to text

while read line; do
    newLine=''
    for word in $line; do
        if [[ "$word" =~ [0-9] ]]; then
            word=$(num2words ${word});
        fi
        newLine+=" ${word}"
    done
    echo -e "${newLine}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'
done<$1
