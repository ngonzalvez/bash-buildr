#!/bin/bash

#
# Handle the option selected by the user from the menu.
#
# @param opt: The chosen option.
#
function Menu_handle_option {
	local opt=$1

	case $opt in
		"Quit")
			echo Good bye!
			exit
			;;

		"Compress CSS")
			clear
			CSS_compress
			Menu_show
			;;

		"Watch for changes")
			clear
			Watch_start
			;;

		"Compress JS")
			clear
			JS_compress
			Menu_show
			;;
	esac
}

#
# Show an options menu.
#
function Menu_show {
	# Prevent bash from treating spaces as separators.
	local OLD_IFS=${IFS}
	IFS=""

	# Define the menu items and the prefix to the user input.
	local options=("Compress JS" "Compress CSS" "Watch for changes" "Quit")
	PS3="> "

	# Show the options menu.
	select opt in ${options[@]};  do
		Menu_handle_option $opt
	done

	# Restore the previous Internal Field Separator.
	IFS=OLD_IFS
}
