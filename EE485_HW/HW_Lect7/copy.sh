#!/bin/bash

cd ~/test
for i in $(seq 1000)
do
    if [ $(expr $i % 3) -eq "0" ]; then
        cp "$i.txt" ~/test_dest
    fi
done