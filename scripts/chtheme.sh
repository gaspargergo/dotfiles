#! /bin/bash
theme=$(cat ~/.config/theme)

# replace theming in config file with desired theme, then move this file in the original config's place
# the theming should alway be at the end of the file
# arguments: path-to-config-file path-to-theme-file
modifyConfig() {
lines=$(wc -l "$2" | cut -d " " -f 1)
cat <(head -n -$lines $1) $2 > ~/.config/colors/temp
mv  ~/.config/colors/temp $1
}

# call all theming changes
# arguments: theme 
modifyTheme() {
	# write current theme into file 
	echo "$1" > ~/.config/theme 
	modifyConfig ~/dotfiles/.config/zathura/zathurarc ~/dotfiles/.config/colors/zathura/$1
	modifyConfig ~/dotfiles/.config/nvim/init.vim ~/dotfiles/.config/colors/nvim/$1
	modifyConfig ~/.mozilla/firefox/6tekjtvb.default-default/chrome/userChrome.css ~/dotfiles/.config/colors/firefox/$1
	modifyConfig ~/.config/gtk-3.0/settings.ini ~/dotfiles/.config/colors/firefox/$1pref
	modifyConfig ~/dotfiles/.dillo/style.css ~/dotfiles/.config/colors/dillo/$1
	modifyConfig ~/dotfiles/.Xresources ~/dotfiles/.config/colors/xterm/$1
	xrdb ~/.Xresources
	~/dotfiles/.config/colors/herbstluftwm/$1.sh
	sed -i "5 c\ <link rel=\"stylesheet\" href=\"/home/gergo/homepage/colors/$1.css\">" ~/homepage/homepage.html
	echo "$1 theme set!"
}

if [[ $# -gt 0 && $1 = "light" || $1 = "dark" ]]
then
	modifyTheme $1
elif [[ $# -gt 0 ]]
then
	echo "Please enter a valid theme argument (light or dark)."
elif [[ $theme = "light" ]]
then
	modifyTheme dark
elif [[ $theme = "dark" ]]
then
	modifyTheme light
fi		
