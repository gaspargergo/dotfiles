#!/bin/bash

hour=$(date "+%-H")
theme=$(cat ~/.config/theme)
late_hour=16
early_hour=6

if [[ $hour -lt $late_hour && $hour -ge $early_hour && $theme = "dark" ]]
then
	~/scripts/chtheme.sh "light"
elif [[ ( $hour -ge $late_hour && $theme = "light" ) || ( $hour -lt $early_hour && $theme = "light" ) ]]
then
	~/scripts/chtheme.sh "dark"
else
	~/scripts/chtheme.sh $theme
fi
