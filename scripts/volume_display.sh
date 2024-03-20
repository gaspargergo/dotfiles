uxterm -xrm "Uxterm.vt100.allowTitleOps: false" -T "volume_display" -hold -e "pactl get-sink-volume 0 | cut -s -d "/" -f 2 && ~/scripts/kill_volume_display.sh" 
