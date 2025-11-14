#! /bin/bash
current_theme=$(cat ~/.config/theme)

#creates a sed script to change the theme values with from two sed script theme files
createFilter() {
	if [[ -a /home/gergo/dotfiles/.config/colors/themes/$1.sed && -a /home/gergo/dotfiles/.config/colors/themes/$2.sed ]];then
		sed -f /home/gergo/dotfiles/.config/colors/themes/$1.sed /home/gergo/dotfiles/.config/colors/theme_template.sed | sed -f /home/gergo/dotfiles/.config/colors/themes/$2.sed - > /home/gergo/dotfiles/.config/colors/filter.sed
		return 0 #success
	else
		echo "$2 does not have a theme sed script."
		return 1 #failure
	fi
}

# call all theming changes
# arguments: theme 
modifyTheme() {
	# write the new theme into file 
	if createFilter $current_theme $1; then 
		echo "$1" > ~/.config/theme 
#
		sed -i -f "/home/gergo/dotfiles/.config/colors/filter.sed" ~/dotfiles/.vimrc
		sed -i -f "/home/gergo/dotfiles/.config/colors/filter.sed" ~/dotfiles/.config/zathura/zathurarc
		sed -i -f "/home/gergo/dotfiles/.config/colors/filter.sed" ~/dotfiles/.config/gtk-3.0/settings.ini
		sed -i -f "/home/gergo/dotfiles/.config/colors/filter.sed" ~/dotfiles/.mozilla/firefox/6tekjtvb.default-default/chrome/includes/cascade-colours.css
		sed -i -f "/home/gergo/dotfiles/.config/colors/filter.sed" ~/dotfiles/.dillo/style.css
		sed -i -f "/home/gergo/dotfiles/.config/colors/filter.sed" ~/dotfiles/.Xresources
		xrdb ~/.Xresources
		sed -i -f "/home/gergo/dotfiles/.config/colors/filter.sed" ~/dotfiles/.config/colors/bspwm.sh
		/home/gergo/dotfiles/.config/colors/bspwm.sh

		echo "$1 theme set!"
		rm /home/gergo/dotfiles/.config/colors/filter.sed
	fi
}

if [[ $# -gt 0 ]]
then
	modifyTheme $1
elif [[ $current_theme = "light" ]]
then
	modifyTheme dark
elif [[ $current_theme = "dark" ]]
then
	modifyTheme light
fi		
