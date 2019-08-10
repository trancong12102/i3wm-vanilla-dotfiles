#!/usr/bin/bash
 
## created by nopain

STATUS_FILE=~/.config/i3status/status/elan

DEVICE="ELAN Touchscreen"
PROP="Device Enabled"

state=$(xinput list-props "$DEVICE" | grep "$PROP" | grep -o "[01]$")


i3_out() {
    weight=$(echo $state | sed 's/1/bold/' | sed 's/0/normal/')
    t_state=$(echo $state | sed 's/0/OFF/' | sed 's/1/ON/')
    echo "<span weight='$weight'>$t_state</span>" > $STATUS_FILE
}

disable() {
    xinput disable "$DEVICE"
    state=0
    i3_out
    notify-send "Touchscreen" "$DEVICE is disabled"
}

enable() {
    xinput enable "$DEVICE"
    state=1
    i3_out
    notify-send "Touchscreen" "$DEVICE is enabled"
}

toggle() {
    if [ $state -eq 0 ];
    then 
        enable
    else 
        disable
    fi
}



if [ "$1" = "t" ];
then   
    toggle
elif [ "$1" = "e" ];
then
    enable
elif [ "$1" = "d" ];
then
    disable
fi
