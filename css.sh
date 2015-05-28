#!/bin/bash

#
# Concatenate and compress the CSS files.
#
function CSS_compress {
	Config_require "CSS_SRC" "Enter the path where CSS files are located"
	Config_require "CSS_DEST" "Enter the path to the directory where the compressed CSS will be located"
	Config_require "CSS_FILE" "Enter the name of the compressed CSS file"

	# If the destination directory doesn't exists, create it.
	mkdir -p "$CSS_DEST"

	# Compress the file css files.
	# Note: sed pattern taken from https://gist.github.com/dominicmartineau/5483359
	cat $CSS_SRC | sed -e 's/^[ \t]*//g; s/[ \t]*$//g; s/\([:{;,]\) /\1/g; s/ {/{/g; s/\/\*.*\*\///g; /^$/d' | sed -e :a -e '$!N; s/\n\(.\)/\1/; ta' > "$CSS_DEST/$CSS_FILE"

	echo "CSS files compressed"; echo
}
