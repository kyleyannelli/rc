#!/bin/bash

MAX_ARGS=1

if [ $# -gt $MAX_ARGS ]; then
	echo "Too many arguments! Please just specify the file path."
	echo "No further arguments are supported!"
	exit 1
elif [ $# -lt $MAX_ARGS ]; then
	echo "Too few arguments! Please specify the file path."
	exit 1
fi

LOG_FILEPATH=$1

while true; do
	if [ -f "$LOG_FILEPATH" ]; then
		echo "File found. Tailing..."
		tail -f "$LOG_FILEPATH"
		break
	else
		echo "File does not yet exist, retrying in 5 seconds..."
		sleep 5
	fi
done

