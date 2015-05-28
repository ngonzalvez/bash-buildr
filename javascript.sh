#!/bin/bash

# Concat all JS files and compress them.
function JS_concat {
	Config_require "JS_SRC" "Introduce the path where your JS files are located"
	Config_require "JS_DEST" "Introduce the path where of the concatenated file"

	# If the destination directory doesn't exists, create it.
	if [ ! -d "$JS_DEST" ]; then
		mkdir -p "$JS_DEST"
	fi

	# Concat all source files into the destination file.
	cat $JS_SRC > "$JS_DEST"

	echo "JS files concatenated"
	echo
}
