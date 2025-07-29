#! /bin/bash
theme=$(cat ~/.config/theme)

# replace theming in config file with desired theme, then move this file in the original config's place
# the theming should alway be at the end of the file
# arguments: path-to-config-file path-to-theme-file
modifyConfig() {
lines=$(wc -l "$2" | cut -d " " -f 1)
sed -f ~/.config/colors/$3.sed $2 | cat <(head -n -$lines $1) - > ~/.config/colors/temp
mv  ~/.config/colors/temp $1
}

# call all theming changes
# arguments: theme 
modifyTheme() {
	# write current theme into file 
	echo "$1" > ~/.config/theme 
	modifyConfig ~/.config/zathura/zathurarc ~/.config/colors/templates/zathura $1
	modifyConfig ~/.vimrc ~/.config/colors/templates/vim $1
	modifyConfig ~/.mozilla/firefox/6tekjtvb.default-default/chrome/userChrome.css ~/.config/colors/templates/firefox $1
	modifyConfig ~/.config/gtk-3.0/settings.ini ~/.config/colors/templates/gtk $1
	modifyConfig ~/.dillo/style.css ~/.config/colors/templates/dillo $1
	modifyConfig ~/.Xresources ~/.config/colors/templates/xterm $1
	xrdb ~/.Xresources
  sed -f ~/.config/colors/$1.sed ~/.config/colors/templates/herbstluftwm.sh | bash
	sed -i "5 c\ <link rel=\"stylesheet\" href=\"/home/gergo/homepage/colors/$1.css\">" ~/homepage/homepage.html
	echo "$1 theme set!"
}

if [[ $# -gt 0 && $1 = "light" || $1 = "dark" || $1 = "ebook" ]]
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
