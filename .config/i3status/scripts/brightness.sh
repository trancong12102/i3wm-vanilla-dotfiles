#!/bin/bash

## created by nopain


STATUS_FILE=~/.config/i3status/status/brightness

while :
do
    bc -l <<< "scale=0; ($(light -G) + 0.5) / 1" > $STATUS_FILE
    sleep 1
done
