#!/bin/bash

# Start watching files for changes.
function Watch_start {

	echo Watching JS files.
	while true; do
		filename=$(inotifywait --format %w -e close_write,create,modify,moved_to,moved_from,delete_self -q $JS_SRC)

		if [ -n "$filename" ]; then JS_compress; fi
	done

	echo Watching CSS files.
	while true; do
		filename=$(inotifywait --format %w -e close_write,create,modify,moved_to,moved_from,delete_self -q $CSS_SRC)

		if [ -n "$filename" ]; then CSS_compress; fi
	done
}
