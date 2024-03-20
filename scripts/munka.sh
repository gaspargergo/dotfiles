#!/bin/sh

hc() {
    herbstclient "$@"
}

choice=$(ls -1 ~/MA/SZAKDOLGOZAT/munka/szövegek/ | fzf)
notes="${choice%.*}"

cd ~/MA/SZAKDOLGOZAT/munka/
hc attr theme.active.color '#558822'
hc chain , split right 0.4 , focus right
hc spawn zathura "~/MA/SZAKDOLGOZAT/munka/szövegek/$choice"
feh --bg-fill ~/Pictures/wallp/poorpoet.jpg

tmux new-session -s munka -n editor -d
tmux send-keys -t munka 'cd ~/MA/SZAKDOLGOZAT/munka/' C-m 
tmux send-keys -t munka "vim ~/MA/SZAKDOLGOZAT/munka/jegyzetek/$notes.md" C-m
tmux split-window -v -l 10% -t munka
tmux send-keys -t munka:1.2 'clear' C-m
tmux new-window -n web -t munka
tmux send-keys -t munka:2 'web' C-m
tmux select-window -t munka:1
tmux select-pane -t munka:1.1
tmux attach -t munka
