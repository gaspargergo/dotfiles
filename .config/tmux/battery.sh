#!/bin/bash

battery=$(acpi)
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
