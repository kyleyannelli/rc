#!/bin/zsh
awk '{printf "%.1f\n", $1}' /tmp/smctemp/cpu_temperature.txt
