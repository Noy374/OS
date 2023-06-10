#!/bin/bash

# определение домашнего каталога пользователя
home_dir=$(eval echo ~)

# получение списка не скрытых подкаталогов в домашнем каталоге
dir_list=$(find "$home_dir" -maxdepth 1 -type d -not -path '*/\.*')

# подсчет общего размера не скрытых каталогов
total_size=0
for dir in $dir_list
do
  if [ -d "$dir" ]; then
    dir_size=$(du -sh "$dir" | awk '{ print $1 }')
    total_size=$((total_size + $(du -s "$dir" | awk '{ print $1 }')))
    echo -e "$dir\t$dir_size" >> "$home_dir/dir_sizes.txt"
  fi
done

# запись общего размера в файл
echo -e "Total size:\t$((total_size/1024))M" >> "$home_dir/dir_sizes.txt"

# вывод сообщения о завершении скрипта
echo "Done. Results written to $home_dir/dir_sizes.txt"
