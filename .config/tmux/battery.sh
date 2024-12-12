#!/bin/bash

battery=$(termux-battery-status | head -n 3 | tail -n 1 | cut -d ":" -f 2 | cut -c 2-3)
percentage=$(echo $battery | cut -d',' -f2 | tr -d ' \n%')
chargingStatus=$(echo $battery | cut -d',' -f1 | cut -d':' -f2| tr -d ' \n')

if [[ "$chargingStatus" == "Charging" ]]
then
	echo "#[fg=green,bold]$percentage%"
elif [[ $percentage -lt 26 ]]
then
	echo -e "\a"
	echo "#[fg=black,bold,bg=red]$percentage%"
else
	echo "#[fg=default,bg=default]$percentage%"
fi
