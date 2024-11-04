#!/bin/bash
clients=""
tags=$(herbstclient tag_status | sed 's/[[:space:]]*//g; s/\./\n/g; s/:/\n/g; s/#/\n/g; s/-/\n/g;'| tail -n +2)

for tag in $tags
do
	currentClients=$(herbstclient list_clients --tag=$tag --title)
	# if not empty (ie. tag has clients), append to all client list
	if [[ -n "$currentClients" ]]
	then
		clients+="$currentClients""\n"
	fi
done

clientNames=$(echo -e "$clients" | cut -d " " -f 2- )
selected=$(echo "$clientNames" | ~/scripts/menus/fzfmenu.sh --prompt="windows: " --reverse)
##Get the window_id of the selected client (-F is used on grep so strange chars in window titles do not mess it up)
windowId=$(echo -e "$clients" | grep -i -F "$selected" | cut -d " " -f 1)
herbstclient jumpto "$windowId"
