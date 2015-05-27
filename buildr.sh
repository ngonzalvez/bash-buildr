#!/bin/bash

CONFIG_FILE=buildr.cfg

# Show an intro message.
function print_intro {
	echo Please select an option from the list bellow.
	echo
}


# Load configuration file into the scope.
function load_config {
	if [ -r $CONFIG_FILE ]; then
		source "./$CONFIG_FILE"
	else
		echo No configuration file found. Creating a new one.
		touch "$CONFIG_FILE"
	fi
}


# Save a new setting to the configuration file.
function save_setting {
	echo "$1=$2" >> "./$CONFIG_FILE"
}


# Concat all JS files and compress them.
function concat_js {
	# If the path to the JS files haven't been set yet, ask the
	# user to enter it.
	if [ -z "$JS_SRC"  ]; then
		echo Introduce the path where your JS files are located.
		read JS_SRC

		save_setting JS_SRC "$JS_SRC"
	fi

	# If the destination folder haven't been set, ask the user to
	# enter it.
	if [ -z "$JS_DEST" ]; then
		echo Where do you want the concatenated JS file to be located?
		read JS_DEST

		save_setting JS_DEST "$JS_DEST"
	fi

	# If the destination directory doesn't exists, create it.
	if [ ! -d "$JS_DEST" ]; then
		mkdir -p "$JS_DEST"
	fi

	# Concat all source files into the destination file.
	cat $JS_SRC > "$JS_DEST/app.js"

	echo "JS files concatenated"
	echo
}


# Start watching files for changes.
function start_watch {
  SOURCE=$JS_SRC

	while true; do
		filename=$(inotifywait --format %w -e close_write,create,modify,moved_to,moved_from,delete_self -q $SOURCE)

		if [ -n "$filename" ]; then compress_js; fi
	done
}


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


# Initialize the app.
function init {
	print_intro
	load_config
	show_menu
}


# Start the app.
init
