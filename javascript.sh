#!/bin/bash

# Concat all JS files and compress them.
function JS_compress {
	Config_require "JS_SRC" "Introduce the path where your JS files are located"
	Config_require "JS_DEST" "Introduce the path to the directory where the concatenated file will be located"
	Config_require "JS_FILE" "Enter the name of the compressed JS file"

	# If the destination directory doesn't exists, create it.
	mkdir -p "$JS_DEST"

	# Concat all source files into the destination file.
	uglifyjs -c -m -o "$JS_DEST/$JS_FILE" $JS_SRC

	echo "JS files compressed"; echo
}
