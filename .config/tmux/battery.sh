#!/bin/bash
endtext=""

#get battery percentage, change color for different states
battery=$(acpi)
percentage=$(echo $battery | cut -d',' -f2 | tr -d ' \n%')
chargingStatus=$(echo $battery | cut -d',' -f1 | cut -d':' -f2| tr -d ' \n')

if [[ "$chargingStatus" == "Charging" ]]
then
	endtext+="#[fg=green,bold]$percentage%"
elif [[ $percentage -lt 26 ]]
then
	endtext+="#[fg=black,bold,bg=red]$percentage%"
else
	endtext+="#[fg=default,bg=default]$percentage%"
fi

echo -e "$endtext"
