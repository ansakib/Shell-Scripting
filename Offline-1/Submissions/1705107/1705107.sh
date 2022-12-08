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

for ((i=1805121; i<=$max_stID; i++))
do
    if [[ -d $i ]] ; then
        cd $i
        if [[ -e $i.sh && -f $i.sh ]] ; then
            chmod +x "$i.sh"
            #ls -l "$i.sh"
            bash $i.sh > "$i.txt"
            count1=$(diff --ignore-all-space "$i.txt" "$root/AcceptedOutput.txt" | grep "<" |wc -l)
            count2=$(diff --ignore-all-space "$i.txt" "$root/AcceptedOutput.txt" | grep ">" |wc -l)
            count=$(($count1 + $count2))
            deduction=$(($count*5))
            marks=$(($max_score-$deduction))
            index=$(($i-1805121))
            if (($marks>0)) ; then
                marksArray[$index]=$marks
            fi
            rm "$i.txt"
        fi
        cd ..
    
    fi
done




for ((i=1805121; i<=$max_stID; i++))
do
    j=$(($i+1))
    for ((; j<=$max_stID; j++))
    do
        if [[ -d $i &&  -d $j && -e $i/$i.sh && -f $i/$i.sh && -e $j/$j.sh && -e $j/$j.sh ]] ; then
            count1=$(diff -ZB "$i/$i.sh" "$j/$j.sh" | grep "<" |wc -l)
            count2=$(diff -ZB "$i/$i.sh" "$j/$j.sh" | grep ">" |wc -l)
            count=$(($count1 + $count2))
            if [[ $count -eq 0 ]]; then
                index1=$(($i-1805121))
                mark1=${marksArray[$index1]}
                if (($mark1>0)) ; then
                    marksArray[$index1]=$((0-$mark1))
                fi
                
                index1=$(($j-1805121))
                mark1=${marksArray[$index1]}
                if (($mark1>0)) ; then
                    marksArray[$index1]=$((0-$mark1))
                fi
                
            fi
        fi    
    done
done

cd $root

echo "student_id" , "score" > output.csv
for ((i=0; i<$max_st; i++))
do
    id=$((1805121+$i))
    sc=${marksArray[$i]}
    echo $id, $sc >> output.csv
done

for mark in ${marksArray[@]}
do
    echo $mark
done