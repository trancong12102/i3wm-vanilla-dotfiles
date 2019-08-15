#!/bin/bash

## Created by nopain

STATUS_FILE=~/.config/i3status/status/diskio

while :
do 
    prv=$(cat $STATUS_FILE)
    io=$(iostat -dx /dev/sda | grep "sda" | awk '{print $21}')

    if [ "$io" = "" ];
    then
        io=prv
    fi 

    echo $io > $STATUS_FILE
    sleep 1
done 
