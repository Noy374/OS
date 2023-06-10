#!/bin/bash

#создание массива с файлами
array=($(ls -Xp | grep -v /))

#создание массива с расширениями
ext=()
for index in ${!array[*]}
do
    if [[ "${array[${index}]##*.}" !=  "${array[${index}-1]##*.}" ]];
    then
        ext+=("${array[$index]##*.}")
    fi
done

#архивирование файлов
for index in ${!ext[*]}
do
    find . -maxdepth 1 -name "*.${ext[$index]##*.}" -type f -exec tar -rf ${ext[$index]##*.}.tar {} \;
done

dates=$(date +"%Y%m%d")
sudo mkdir /var/backups/$dates
find . -maxdepth 1 -name "*.tar" -exec sudo mv {} /var/backups/$dates \;
