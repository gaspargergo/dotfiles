#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/bash-completion/bash_completion
source /usr/share/fzf/key-bindings.bash


# --- ALIASES ---
alias sudo="sudo "
alias web="w3m /home/gergo/.w3m/bookmark.html"
alias less="less -Q"
alias largefiles="du -sh * | sort -rh | head -10"
alias off="sudo poweroff"
alias mutt="neomutt"
alias kbreset="setxkbmap -layout hu"
alias feh="feh -g 800x600 --scale-down"
alias hc="herbstclient"
alias chtheme="~/scripts/chtheme.sh"
alias monthlybackup="~/scripts/monthlybackup.sh"
alias weather="~/scripts/weather.sh"
alias internet_sync="~/scripts/internet_sync.sh"
alias ls="ls -p --group-directories-first --color=auto"
alias yt-dlp="yt-dlp --embed-subs --force-ipv4 --restrict-filenames -f '((bv*[fps>30]/bv*)[height<=720]/(wv*[fps>30]/wv*)) + ba / (b[fps>30]/b)[height<=720]/(w[fps>30]/w)'"
alias redshift="redshift -o"
alias lsvlength='for f in *; do ffmpeg -i "$f" 2>&1 | grep Duration | cut -d " " -f 4 | sed s/,//  | tr -d "\n" && echo " $f"; done' #gets length of all videos in current directory
alias dict="sdcv -c"
alias clock='xclock -d -brief -face "Comic Code-18"'

update_prompt() {
battery=$(acpi)
percentage=$(echo $battery | cut -d',' -f2 | tr -d ' \n%')
chargingStatus=$(echo $battery | cut -d',' -f1 | cut -d':' -f2| tr -d ' \n')

if [[ $chargingStatus == "Charging" ]]
then
	export PS1=" \[\e[01;34m\]\w\[\e[m\] \[\e[01;32m\]>>>\[\e[m\] "
elif [[ $percentage -lt 25 ]]
then
	export PS1=" \[\e[01;34m\]\w\[\e[m\] \[\e[01;31m\]>>>\[\e[m\] "
else
	export PS1=" \[\e[01;34m\]\w\[\e[m\] \[\e[01;31m\]>\[\e[m\]\[\e[01;33m\]>\[\e[m\]\[\e[01;32m\]>\[\e[m\] "
fi
}
# Prompt, current dir and decoration 
export PS1=" \[\e[01;34m\]\w\[\e[m\] \[\e[01;31m\]>\[\e[m\]\[\e[01;33m\]>\[\e[m\]\[\e[01;32m\]>\[\e[m\] "

#Color less for manpage reading
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# --- SHOPT ---
#cd without the command
shopt -s autocd
#attempt to correct mistyped directory names after cd
shopt -s cdspell
#attempt to correct mistyped directory names in autocomplete
shopt -s dirspell
#store multiline commands in one history entry
shopt -s cmdhist
#multiline commands are saved with newlines instead of semicolons
shopt -s lithist
#don't attempt to complete an empty line
shopt -s no_empty_cmd_completion
#append history instead of overwriting
shopt -s histappend
#instantly update hist after a command
PROMPT_COMMAND='history -a;history -n;update_prompt'

export EDITOR='vim'
export BROWSER='dillo'
export VISUAL='vim'
export STARDICT_DATA_DIR='/home/gergo/stardict'

# show man page for command preceding the cursor
run-help() { help "$READLINE_LINE" 2>/dev/null || man "$READLINE_LINE"; }
bind -m vi-insert -x '"\eh": run-help'

export HISTFILESIZE=15000
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=3000

#when in terminal only, create tmux session; in tmux window, print a pokemon
if [[ "$TERM" == "tmux-256color" ]]
then
	/home/gergo/scripts/pokescript/pokemon-colorscripts.sh -r
fi

if [[ "$TERM" == "xterm-256color" ]]
then
	#tmux attach-session -t "$USER" || tmux new-session -s "$USER"
	echo ""
	/home/gergo/scripts/pokescript/pokemon-colorscripts.sh -r
fi
