#! /bin/bash

cd ~
pdf=$(find ~ -name "*.pdf" -o -name "*.epub" | ~/scripts/menus/fzfmenu.sh --prompt="Zathura: " --reverse) 
if [[ $pdf != "" ]]
then
	zathura "$pdf" 
fi
