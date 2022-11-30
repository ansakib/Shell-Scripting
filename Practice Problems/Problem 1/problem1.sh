#!/bin/bash
[[ $# -eq 0 ]] && echo "Usage: ./problem1.sh filename1, filename2, ..."



for file in $*
do
    if [[ -e $file ]] ; then
        if [[ -f $file ]] ; then
            if [[ -x $file ]] ; then
                echo "$file is currently executable"
                echo $(ls -l $file)
                echo "$file 's executable permission is now changing."
                chmod -x $file
                echo $(ls -l $file)
                echo "$file is currently not executable."
            else
                echo $(ls -l $file)
            fi
        else 
            echo "$file is not a regular file"
        fi
    else
        echo "$file does not exist"
    fi
done

        
