#!/bin/bash

wget -o genshin.zip 'https://docs.google.com/uc?export=download&id=1oGHdTf4_76_RacfmQIV4i7os4sGwa9N'

unzip genshin.zip 

unzip genshin_character.zip

path="/home/icel/sisopsusah/genshin_character"
mkdir "$path/Inazuma" && mkdir "$path/Mondstat" && mkdir "$path/Liyue" && mkdir "$path/Sumeru" && mkdir "$path/Fontaine"

for file in $path/*.jpg; do
  
  #change hex to ascii
  name=$(echo "${file%.*}")
  fix=$(echo "${name##*/}")
  soal3=$(echo $fix | xxd -r -p)
  mv -- "$path/$fix".jpg "$soal3".jpg

  #change name and move to region
  region=$(awk -F,  "/$soal3/"'{OFS=","; print $2}' list_character.csv)
  change=$(awk -F,  "/$soal3/"'{OFS=",";print $2 "-" $1 "-" $3 "-" $4}' list_character.csv)
  mv -- "$soal.jpg" "$change".jpg
  mv "$change".jpg "$path/$region"

done

awk '
BEGIN { print "Weapon Count:" }
/Claymore/  { ++l }
/Polearm/ { ++m }
/Catalyst/ { ++n }
/Bow/ { ++o }
/Sword/ { ++p }
END { print "Polearm:"m "\nClaymore:"l "\nBow:"o "\nCatalyst:"n "\nSword:"p }' list_character.csv


rm -r genshin_character.zip && rm -r list_character.csv && rm -r genshin.zip
