#!/bin/bash

echo "Creating comparison txts"
find . -name "channel*" | grep -v -e eye -e mountain | sort > chs.txt
find mountains -name "firings.mda" | cut -d "/" -f 2 | sort > mda.txt

echo "Missing mda files"
grep -v -f mda.txt chs.txt

echo "Submitting mda jobs"
cwd=`pwd`; for i in `grep -v -f mda.txt chs.txt`; do echo $i; cd $i; sbatch /data/src/PyHipp/sort-slurm.sh; cd $cwd; done
