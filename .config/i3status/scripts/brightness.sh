#!/bin/bash

## created by nopain


STATUS_FILE=~/.config/i3status/status/brightness

while :
do
    prv=$(cat $STATUS_FILE)
    brightness=$(bc -l <<< "scale=0; ($(light -G) + 0.5) / 1")

    if [ "$brightness" = "" ];
    then
        brightness=$prv
    fi

    echo $brightness > $STATUS_FILE
    sleep 1
done
