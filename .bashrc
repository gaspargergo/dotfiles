#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/bash-completion/bash_completion
source /usr/share/fzf/key-bindings.bash


# --- ALIASES ---
alias web="w3m /home/gergo/.w3m/bookmark.html"
alias less="less -Q"
alias weather="curl wttr.in"
alias vim="nvim"
alias largefiles="du -sh * | sort -rh | head -10"
alias off="sudo poweroff"
alias mutt="neomutt"
alias kbreset="setxkbmap -layout hu"
alias feh="feh -g 800x600 --scale-down"
alias hc="herbstclient"
alias chtheme="~/scripts/chtheme.sh"
alias munka="~/scripts/munka.sh"
alias ls="ls -p --group-directories-first --color=auto"
alias messenger="~/Downloads/Caprine*"
alias radio="curseradio"
alias refresh_z="~/scripts/menus/zathura/refresh_db.sh"

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

export EDITOR='nvim'
export BROWSER='w3m'
export VISUAL='nvim'
xset b off

# show man page for command preceding the cursor
run-help() { help "$READLINE_LINE" 2>/dev/null || man "$READLINE_LINE"; }
bind -m vi-insert -x '"\eh": run-help'

export HISTFILESIZE=6000
export HISTCONTROL=ignoreboth
export HISTSIZE=3000

#when in terminal only, create tmux session; in tmux window, print a pokemon
if [[ "$TERM" == "tmux-256color" ]]
then
	/home/gergo/scripts/pokescript/pokemon-colorscripts.sh -r
fi

if [[ "$TERM" == "st-256color" ]]
then
	tmux attach-session -t "$USER" || tmux new-session -s "$USER"
fi
