#!/bin/bash

read -p "Введите исполнителя: " del_singer

#Удаление в unsort
unsort_file=$(find "/home/karsva/Desktop/lab3/unsorted" -type f -name "singer.txt" -exec grep -r -i -s -l "$del_singer" {} \;)
#echo $unsort_file
path=$(dirname $unsort_file)
#echo $path
rm -rf $path

#Удаление в singer
sort_file=$(find "/home/karsva/Desktop/lab3/sorted/Singer/$del_singer" -type l)
rm -rf /home/karsva/Desktop/lab3/sorted/Singer/$del_singer
name=($(basename -a $sort_file))

for index in ${!name[*]}
do
find "/home/karsva/Desktop/lab3/sorted" -type l -iname "${name[$index]}*" -exec rm -f {} \+
find "/home/karsva/Desktop/lab3/sorted" -type d -empty -delete
done
