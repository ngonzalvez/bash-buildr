#!/bin/bash

# Import dependencies.
. ./config.sh
. ./javascript.sh
. ./css.sh
. ./watch.sh
. ./menu.sh

# Show an intro message.
function App_intro_message {
	echo Please select an option from the list bellow.
	echo
}

# Initialize the app.
Config_load
App_intro_message
Menu_show
