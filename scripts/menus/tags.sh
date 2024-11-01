#!/bin/bash

reset=$(printf "\e[0m")
active_selected=$(printf "\e[37;41m")
active=$(printf "\e[32m")
default=$(printf "\e[97m")


clients=$(herbstclient tag_status | sed 's/[[:space:]]*//g; s/\./\n/g; s/:/\n/g; s/#/\n/g'| tail -n +2)
selected=$(echo "$clients" | ~/scripts/menus/fzfmenu.sh --reverse --prompt="tags: ")

if [[ $selected != "" ]]
then
	herbstclient use $selected
fi
