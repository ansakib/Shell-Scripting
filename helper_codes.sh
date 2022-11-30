#!/bin/bash

# echo "Enter a value: "
# read var
# echo "$var"

################### if-else ##########################
# if [ $var -ge 80 ]; then

#     echo "Got A+"

# elif [ $var -ge 70 ]; then
#     echo "Got B"
# else 
#     echo "Fail"
# fi



############### better if-else ########################
# read var
# if [[ $var -ge 80 &&  $var -le 100 ]]; then

#     echo "Got A+"

# elif [[ $var -ge 70 ]]; then
#     echo "Got B"
# else 
#     echo "Fail"
# fi


############### numerical condition ######################
# read var
# if (( $var >= 80 &&  $var <= 100 )); then

#     echo "Got A+"

# elif (( $var >= 70 )); then
#     echo "Got B"
# else 
#     echo "Fail"
# fi



################### for loop ###########################
# for ((i=0; i<=$var; i++))
# do
#     echo $i
# done


# for i in $(ls)
# do
#     echo $i
#  done


# for file in *
# do
#     echo -n "$file is: "
#     if [ -f $file ]; then
#         echo "is File"
#     else
#         echo "NOT File"
#     fi

# done



#################### command line arguments #############################


# echo "Number of Args: $#"

# for arg in $*
# do
#     echo $arg
# done

# echo "first argument: $1"
# echo "second argument: $2"


##################### while loop ###########################

# expected_pass="sakib"
# read pass
# while [ $pass != $expected_pass ]
# do
#     echo "wrong password"
#     read pass
# done
# echo "Welcome!"




############## function #######################################

# myfn() {
#     echo 10
# }

# x=$(myfn)
# echo "inside func: $x"





############### some interesting #####################

# grep xyz b.cpp
# echo $?  --> eta dile previous command ki return korse ta dekhabe.
#             jodi kono match pai tahole 0 dibe, match na paile non-zero dibe


#if cmd ; then --------
#example:

# if grep "look" dreamers.txt ; then
#     echo "Found match"
# fi








############## read line sh #################################

# IFS= (or IFS='') prevents leading/trailing whitespace from being trimmed
# -r prevents backslash escapes from being interpreted

# [[ $# -ne 1 ]] && exit 1

# pat=$1

# # while read line; do
# while read line; do
#     if echo "$line" | grep -q "$1"; then
#         echo "$line"
#     fi
#     # if grep -q "cin" <(echo "$line"); then
#     #     echo "$line"
#     # fi
# done



################ Factorial ##############################

# fact() {
#     if [[ $1 -eq 0 ]]; then
#         echo 1
#         return
#     fi

#     last=$(fact $(( $1 - 1 )))

#     echo $(( $1 * last ))
# }

# fact $1



################### Array ##############################

# myArray=("cat" "dog" "mouse" "frog")
# myArray[10]="far"

# # iterate over values
# for str in ${myArray[@]}; do
#   echo $str
# done

# # accessing using indices
# for i in ${!myArray[@]}; do
#   echo "element $i is ${myArray[$i]}"
# done