#!/bin/bash

## Created by nopain

MIN_TEMP=3500
BG="#ffb4a2"

HUE_FILE=~/.config/i3status/status/hueshift
HUE_CONF=~/.config/i3status/conf/hue.conf

. $HUE_CONF

i3_out() {
    if [ "$shift" -eq "0" ];
    then
        state="OFF"
    else
        state="$temp K"
    fi

    echo $state > $HUE_FILE
}

write_config() {
cat <<EOM >$HUE_CONF
temp=$temp
shift=$shift
EOM

}

reset() {
    shift=0
    redshift -x
    i3_out
    write_config
}

set() {
    shift=1
    val_s=$1
    
    if [ -z "$1" ];
    then
        val_s=$temp
    fi
    
    redshift -P -O $val_s
    temp=$val_s
    echo "$temp K"
    i3_out
    write_config
}

up() {
    val_u=$1
    
    if [ -z "$1" ];
    then
        val_u=500
    fi
    
    temp=$((temp + $val_u))
    set $temp
}

down() {
    val_d=$1
    
    if [ -z "$1" ];
    then
        val_d=500
    fi
    
    temp=$((temp - $val_d))
    
    if [ "$temp" -lt "$MIN_TEMP" ];
    then
        temp=3500
    fi
    
    set $temp
}

toggle() {
    if [ "$shift" -eq "0" ]; 
    then
        set $temp
    else
        reset
    fi
}

init() {
    if [ "$shift" -eq "0" ]; 
    then
        reset
    else
        set
    fi
}

if [ "$1" = "u" ];
then 
    up $2
fi

if [ "$1" = "d" ];
then
    down $2
fi

if [ "$1" = "s" ];
then
    set $2
fi

if [ "$1" = "t" ];
then
    toggle
fi

if [ "$1" = "i" ];
then
    init
fi
