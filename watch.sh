#!/bin/bash

# Start watching files for changes.
function Watch_start {
  SOURCE=$JS_SRC

	while true; do
		filename=$(inotifywait --format %w -e close_write,create,modify,moved_to,moved_from,delete_self -q $SOURCE)

		if [ -n "$filename" ]; then JS_concat; fi
	done
}
