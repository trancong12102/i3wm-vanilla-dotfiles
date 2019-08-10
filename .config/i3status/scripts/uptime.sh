#!/bin/bash

## created by nopain


STATUS_FILE=~/.config/i3status/status/uptime

upt() {
    s=$(awk '{print $1}' /proc/uptime)
    s=$(bc -l <<< "scale=0; $s / 1")

    m=$(bc -l <<< "scale=0; $s / 60")
    s=$(bc -l <<< "scale=0; $s % 60")

    h=$(bc -l <<< "scale=0; $m / 60")
    m=$(bc -l <<< "scale=0; $m % 60")

    d=$(bc -l <<< "scale=0; $h / 24")
    h=$(bc -l <<< "scale=0; $h % 24")

    out=$(echo "$s"s)

    if [ $d -gt 0 ];
    then
        out=$(echo "$d"d "$h"h "$m"m "$s"s)
    elif [ $h -gt 0 ];
    then
        out=$(echo "$h"h "$m"m "$s"s)
    elif [ $m -gt 0 ]; 
    then
        out=$(echo "$m"m "$s"s)
    fi
}

while :
do
    upt
    echo $out > $STATUS_FILE

    sleep 1
done