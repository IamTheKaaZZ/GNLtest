#!/bin/bash

a=1

while [ $a -le 8 ]
do
    printf %s "$(<../deepthought/test"$a"output.log)" > ../deepthought/test"$a"output.log
    a=$((a+1))
done
