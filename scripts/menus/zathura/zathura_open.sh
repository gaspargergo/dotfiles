#! /bin/bash

cd ~
pdf=$(cat ~/scripts/menus/zathura/database.txt | ~/scripts/menus/fzfmenu.sh --prompt="Zathura: " --reverse) 
if [[ $pdf != "" ]]
then
	zathura "$pdf" 
fi
