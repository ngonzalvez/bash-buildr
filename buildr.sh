#!/bin/bash

# Import dependencies.
. ./config.sh
. ./javascript.sh
. ./watch.sh
. ./menu.sh

# Show an intro message.
function print_intro {
	echo Please select an option from the list bellow.
	echo
}

# Initialize the app.
load_config
print_intro
show_menu
