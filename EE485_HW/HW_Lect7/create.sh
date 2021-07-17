#!/bin/bash
mkdir ~/test
for index in $(seq 1000)
do
    touch "$index.txt"
    mv "$index.txt" ~/test
done