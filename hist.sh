#!/bin/bash
INFILE=$1
XAXIS=$2
YAXIS=$3
SIZE=$4

TERM_WIDTH="$( tput cols )"
TERM_HEIGHT="$( tput lines )"

if [ $SIZE == 'small' ]; then
    cat $INFILE | awk '{print length}' | gnuplot -p -e "set terminal dumb $(($TERM_WIDTH / 5)) $(($TERM_HEIGHT / 5)); set xr [0:$((100*$XAXIS))]; set yr [0:$((100*$YAXIS))]; set xlabel 'Number of characters in line'; set title 'HISTOGRAM OF CHARS PER LINE'; plot '-' using 1 smooth freq with boxes;"
elif [ $SIZE == 'medium' ]; then
    cat $INFILE | awk '{print length}' | gnuplot -p -e "set terminal dumb $(($TERM_WIDTH / 2)) $(($TERM_HEIGHT / 2)); set xr [0:$((100*$XAXIS))]; set yr [0:$((100*$YAXIS))]; set xlabel 'Number of characters in line'; set title 'HISTOGRAM OF CHARS PER LINE'; plot '-' using 1 smooth freq with boxes;"
elif [ $SIZE == 'large' ]; then
    cat $INFILE | awk '{print length}' | gnuplot -p -e "set terminal dumb $TERM_WIDTH $TERM_HEIGHT; set xr [0:$((100*$XAXIS))]; set yr [0:$((100*$YAXIS))]; set xlabel 'Number of characters in line'; set title 'HISTOGRAM OF CHARS PER LINE'; plot '-' using 1 smooth freq with boxes;"
fi
