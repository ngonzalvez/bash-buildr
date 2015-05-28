#!/bin/bash

CONFIG_FILE=.buildrrc

# Load configuration file into the scope.
function load_config {
	if [ -r $CONFIG_FILE ]; then
		source "./$CONFIG_FILE"
	else
		echo No configuration file found. Creating a new one.
		echo
		touch "$CONFIG_FILE"
	fi
}


# Save a new setting to the configuration file.
function save_config {
	echo "$1=$2" >> "./$CONFIG_FILE"
}
