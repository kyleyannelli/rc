#!/bin/zsh
kbRss=$(ps -p ${1} -o rss | sed '1d;/^--$/d')
mbRss=$((x=0.0009765625, y=$kbRss, x*y))
printf '%.2f Mb\n' ${mbRss}
