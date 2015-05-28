#!/bin/bash

CONFIG_FILE=.buildrrc

#
# Load all configurations from the config file or create it if it
# doesn't exists.
#
function Config_load {
	if [ -r $CONFIG_FILE ]; then
		source "./$CONFIG_FILE"
	else
		echo No configuration file found. Creating a new one.
		echo
		touch "$CONFIG_FILE"
	fi
}

#
# Save a new setting to the configuration file.
#
# @param name: The name of the configuration to be saved.
# @param value: The value for said configuration.
#
function Config_save {
	local name="$1"
	local value="$2"

	# Append the configuration to the file.
	echo "$name=$value" >> "./$CONFIG_FILE"
}

#
# Require a configuration to be set.
#
# @param config_name: The name of the configuration.
# @param message: Message to be shown when asking the user for input.
#
function Config_require {
	local config_name=$1
	local message=$2
	eval local value="$"$1

	if [ -z "$value" ]; then
		echo $message
		read $config_name

		Config_save $config_name "$value"
	fi
}
