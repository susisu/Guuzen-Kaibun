#!/bin/sh

for file in data/txt/*.txt
do
    bin/extract $file > "data/results/`basename $file`.dat"
    echo "done: $file"
done
