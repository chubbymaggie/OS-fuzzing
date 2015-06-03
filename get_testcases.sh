#!/bin/sh

printf "" > testcases.csv

for bin in $(ls /usr/bin | shuf); do
  binp="$(which $bin)"
  if [ "$(file $binp | grep 'ELF 32-bit LSB')" ] ; then
    echo $binp
    ../ManFuzzer/manfuzzer.py $binp -n 100 --seeds ~/seeds >> testcases.csv
  fi
done
