#!/bin/bash

root=$(pwd)

cd movie_data

oldIFS=$IFS

IFS=$'\n'

for file in $(ls)
do
    if [[ $file == *.txt ]] ; then
        dirName=$(tail -n2 $file | head -n1)
        mkdir -p $dirName
        mv $file $dirName
    fi
done

IFS=$oldIFS