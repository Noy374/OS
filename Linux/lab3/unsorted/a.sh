#!/bin/bash

read -p "Path: " path

if [ -f $path ]; then

read -p "Composer: " composer
read -p "Genre: " genre
read -p "Poet: " poet
read -p "Singer: " singer

num=($(ls "/home/karsva/Desktop/lab3/unsorted" -1 | wc -l))
let "num++"
mkdir "/home/karsva/Desktop/lab3/unsorted/song$num"
mv $path "/home/karsva/Desktop/lab3/unsorted/song$num"
name=${path##*/}
#echo $name
path="/home/karsva/Desktop/lab3/unsorted/song$num/$name"
#echo $path

touch "/home/karsva/Desktop/lab3/unsorted/song$num/composer.txt"
echo $composer > "/home/karsva/Desktop/lab3/unsorted/song$num/composer.txt"
touch "/home/karsva/Desktop/lab3/unsorted/song$num/genre.txt"
echo $genre > "/home/karsva/Desktop/lab3/unsorted/song$num/genre.txt"
touch "/home/karsva/Desktop/lab3/unsorted/song$num/poet.txt"
echo $poet > "/home/karsva/Desktop/lab3/unsorted/song$num/poet.txt"
touch "/home/karsva/Desktop/lab3/unsorted/song$num/singer.txt"
echo $singer > "/home/karsva/Desktop/lab3/unsorted/song$num/singer.txt"

mkdir "/home/karsva/Desktop/lab3/sorted/Composer/$composer"
mkdir "/home/karsva/Desktop/lab3/sorted/Genre/$genre"
mkdir "/home/karsva/Desktop/lab3/sorted/Poet/$poet"
mkdir "/home/karsva/Desktop/lab3/sorted/Singer/$singer"

ln -s "$path" "/home/karsva/Desktop/lab3/sorted/Composer/$composer/$name"
ln -s "$path" "/home/karsva/Desktop/lab3/sorted/Genre/$genre/$name"
ln -s "$path" "/home/karsva/Desktop/lab3/sorted/Poet/$poet/$name"
ln -s "$path" "/home/karsva/Desktop/lab3/sorted/Singer/$singer/$name"

else
echo "File don't exist"
exit 1
fi
