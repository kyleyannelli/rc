#!/bin/bash

# Available directions are north, south, east and west
DIRECTION=$1

# focus the window within the monitor
yabai -m window --focus $DIRECTION

# otherwise attempt to move to monitor in that direction
if [ $? -ne 0 ]; then
	yabai -m display --focus $DIRECTION
fi

