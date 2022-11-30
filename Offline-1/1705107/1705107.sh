#!/bin/bash

max_score=100
max_st=5


if [[ $# -eq 1 ]] ; then
    max_score=$1
elif [[ $# -eq 2 ]] ; then
    max_score=$1
    max_st=$2
fi

max_stID=$((1805120 + $max_st))

#echo $max_stID
# echo $max_score
# echo $max_stID

marksArray=()
for ((i=0; i<$max_st; i++))
do
    marksArray[$i]=0;
done

# for mark in ${marksArray[@]}
# do
#     echo $mark
# done

root=$(pwd)
cd Submissions

# for dir in $(ls)
# do
#     cd $dir
#     chmod +x "$dir.sh"
#     ls -l "$dir.sh"
#     cd ..
# done
