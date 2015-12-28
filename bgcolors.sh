#!/bin/bash

folder=$(dirname $1)
name=$(echo $1 | awk -F. '{ print $1 }')
image=$1

cont=0
for i in $(colors -en 16 $image )
do
  case $cont in
    1)
      background=$(echo $i | tr -d '#')
      ;;
    6)
      neutral=$(echo $i | tr -d '#' )
      ;;
    14)
      foreground=$(echo $i | tr -d '#')
      ;;
  esac
  printf "*color%d:%s\n" $cont $i
  cont=$(( cont + 1 ))
done

printf "\n*background:#%s" $background 
printf "\n*foreground:#%s\n" $foreground
rm /home/$USER/.colors
printf "BACKGROUND #FF%s\n" $background >> /home/$USER/.colors
printf "FOREGROUND #FF%s\n" $foreground >> /home/$USER/.colors
printf "NEUTRAL #FF%s\n" $neutral >> /home/$USER/.colors

feh --bg-fill $image
cp $image "$folder/wp.png"
