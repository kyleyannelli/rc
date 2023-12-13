#!/bin/bash

DIRECTION=$1

yabai -m window --swap $DIRECTION

if [ $? -ne 0 ]; then
	yabai -m display --swap $DIRECTION
fi

