#!/bin/bash

for cmd in $(ls ~/scripts/sync_scripts/ | fzf -m)
do
	bash "/home/gergo/scripts/sync_scripts/$cmd"
done
