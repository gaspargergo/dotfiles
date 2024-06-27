# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

if command -v startx &> /dev/null 
then
	exec startx
fi
