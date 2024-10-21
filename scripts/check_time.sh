#!/bin/bash

hour=$(date "+%-H")
theme=$(cat ~/.config/theme)

if [[ $hour -lt 19 && $hour -gt 6 && $theme = "dark" ]]
then
	~/scripts/chtheme.sh "light"
elif [[ $hour -gt 19 && $hour -lt 6 && $theme = "light" ]]
then
	~/scripts/chtheme.sh "dark"
fi
