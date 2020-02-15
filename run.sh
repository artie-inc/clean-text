#!/bin/bash

./clean.sh $1 > /tmp/clean.txt
./remove-bad-numbers.sh /tmp/clean.txt > /tmp/good-nums.txt
./replace-numbers.sh /tmp/good-nums.txt > ${1}-clean-no-nums.txt
