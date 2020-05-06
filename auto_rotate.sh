#!/bin/bash
# Script copied from superuser.com/questions/36645#answer-36694

function main() {
    for f in *.JPG
    do
            orientation=$(jhead -v $f | sed -nr 's:.*Orientation = ([0-9]+).*:\1:p')
    
            if [ -z $orientation ]
            then
                    orientation=0
            fi
    
            if [ $orientation -gt 1 ]
            then
                    echo Rotating $f...
                    mv $f $f.bak
                    convert -auto-orient $f.bak $f
                    rm $f.bak
            fi
    done
}

main
