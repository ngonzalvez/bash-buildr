#!/bin/bash

# Concat all JS files and compress them.
function concat_js {
	# If the path to the JS files haven't been set yet, ask the
	# user to enter it.
	if [ -z "$JS_SRC"  ]; then
		echo Introduce the path where your JS files are located.
		read JS_SRC

		save_config JS_SRC "$JS_SRC"
	fi

	# If the destination folder haven't been set, ask the user to
	# enter it.
	if [ -z "$JS_DEST" ]; then
		echo Where do you want the concatenated JS file to be located?
		read JS_DEST

		save_config JS_DEST "$JS_DEST"
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
