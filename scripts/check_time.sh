#!/bin/bash

hour=$(date "+%-H")
theme=$(cat ~/.config/theme)

if [[ $hour -lt 16 && $hour -gt 6 && $theme = "dark" ]]
then
	~/scripts/chtheme.sh "light"
elif [[ ( $hour -gt 16 && $theme = "light" ) || ( $hour -lt 6 && $theme = "light" ) ]]
then
	~/scripts/chtheme.sh "dark"
fi
