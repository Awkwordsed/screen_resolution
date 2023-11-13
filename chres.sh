#!/usr/bin/env bash

read -p "Enter display :" display
read -p "Enter width :" width
read -p "Enter height :" height

cvt_output=$(cvt $width $height)
modeline=$(echo "$cvt_output" | grep -oP 'Modeline\s+\K.*')
resolution=$(echo "$cvt_output" | grep -oP 'Modeline\s+"\K[^"]+' | head -n 1)

xrandr --newmode $modeline
xrandr --addmode $display '"'$resolution'"'
xrandr --output $display --mode '"'$resolution'"'


