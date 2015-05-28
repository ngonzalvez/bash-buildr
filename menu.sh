#!/bin/bash

# Define a handler for each option.
function handle_option {
	case $1 in
		"Quit")
			echo Good bye!
			exit
			;;

		"Compile SCSS")
			clear
			echo "SCSS Compilation [To be implemented]"
			echo
			show_menu
			;;

		"Watch for changes")
			clear
			start_watch
			;;

		"Concat JS")
			clear
			concat_js
			show_menu
			;;
	esac
}


# Show an options menu.
function show_menu {
	# Prevent bash from treating spaces as separators.
	OLD_IFS=${IFS}
	IFS=""

	# Define the menu items and the prefix to the user input.
	MENU_OPTIONS=("Concat JS" "Compile SCSS" "Watch for changes" "Quit")
	PS3="> "

	# Show the options menu.
	select opt in ${MENU_OPTIONS[@]};  do
		handle_option $opt
	done

	# Restore the previous Internal Field Separator..
	IFS=OLD_IFS
}
