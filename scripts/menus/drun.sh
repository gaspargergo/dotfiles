#! /bin/bash

application=$(ls /usr/share/applications/ | ~/scripts/menus/fzfmenu.sh --prompt='drun: ' --reverse)
#grab the executable from the desktop file, then strip the unnecessary fluff from the command
bin=$(cat "/usr/share/applications/$application" | grep "Exec" | head -n 1 | cut -d "=" -f 2 | cut -d " " -f 1)
echo "$bin"

if [[ "$bin" != "" ]]
then
	command $bin
fi
