#!/bin/zsh
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

while :
do
    usr/local/bin/smctemp -c -i25 -n1000 -f
    sleep 0.75
done

