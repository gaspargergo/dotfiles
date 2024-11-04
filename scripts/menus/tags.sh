#!/bin/bash

tags=$(herbstclient tag_status | sed 's/[[:space:]]*//g; s/\./\n/g; s/:/\n/g; s/#/\n/g; s/-/\n/g'| tail -n +2)
echo $tags
selected=$(echo "$tags" | ~/scripts/menus/fzfmenu.sh --reverse --prompt="tags: ")

if [[ $selected != "" ]]
then
	herbstclient use $selected
fi
