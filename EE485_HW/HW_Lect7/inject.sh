#!/bin/bash

cd ~/test
for index in $(seq 1000)
do
    for rep in $(seq $index)
    do
        echo -n "a" >> "$index.txt"
    done
done

#for index in $(seq 1000)
#do
#    echo -n "" > "$index.txt"
#done