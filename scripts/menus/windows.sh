clients=$(xlsclients -l)
#Select a client from the list generated by xlsclients; the Instance/Class field is used to display the names
instances=$(echo "$clients" | grep "^  Instance/Class:" | cut -d ":" -f 2 | cut -d "/" -f 2)
selected=$(echo $instances | sed 's/ /\n/g' | ~/scripts/menus/fzfmenu.sh --prompt="windows: " --reverse)

#Get the line number of the selected Instance/Class, the window_id is on the second line above
window_line_number=$(echo "$clients" | grep -i -m1 -n "$selected" | cut -d ":" -f 1)
window_id=$(echo "$clients"| head -n $(($window_line_number-2)) | tail -1 | cut -d " " -f 2| sed 's/://g')
echo "$window_id"
herbstclient jumpto "0x$window_id"
