#!/bin/bash

echo "Creating comparison txts"
find . -name "channel*" | grep -v -e eye -e mountain | sort > chs.txt
find . -name "rplhighpass*hkl" | grep -v -e eye | sort | cut -d "/" -f 1-4 > hps.txt

echo "Missing hkl files"
comm -23 chs.txt hps.txt

echo "Submitting hkl jobs"
cwd=`pwd`; for i in `comm -23 chs.txt hps.txt`; do echo $i; cd $i; sbatch /data/src/PyHipp/rplhighpass-sort-slurm.sh; cd $cwd; done
