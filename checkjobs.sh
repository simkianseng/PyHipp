#!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo "Creating comparison txts"
find . -name "channel*" | grep -v -e eye -e mountain | sort > chs.txt
find . -name "rplhighpass*hkl" | grep -v -e eye | sort | cut -d "/" -f 1-4 > hps.txt
find mountains -name "firings.mda" | cut -d "/" -f 2 | sort > mda.txt

echo "Missing hkl files"
comm -23 chs.txt hps.txt

echo "Missing mda files"
grep -v -f mda.txt chs.txt
