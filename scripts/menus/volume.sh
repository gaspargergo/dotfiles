#!/bin/bash

# options to be displyed
options="mute\n"
for i in {0..10}
do
	options+="$(($i*10))%\n"
done

volume=`amixer -c 1 get Master | tail -n 1 | cut -d' ' -f6 | tr -d '[-]'`
mute=`amixer -c 1 get Master | tail -n 1 | cut -d' ' -f8 | tr -d '[-]'` 

if [ "$mute" == "off" ]
then
	mute=" (muted)"
else
	mute=""
fi

selected="$(echo -e "$options" | rofi -dmenu -p "$volume$mute")"

if [ $selected == "mute" ]
then
	amixer -q -c 1 sset Master toggle 
else
	amixer -q -c 1 sset Master "$selected" 
fi

