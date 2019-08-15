 #!/bin/bash
 
 ## created by nopain
 
DEVICE="Synaptics TM3053-004"
STATUS_FILE=~/.config/i3status/status/touchpad

get_state() {
    xinput list | grep -iq mouse && mouse=1 || mouse=0
    m_state=$(echo $mouse | sed 's/1/plugged in/' | sed 's/0/unplugged/')

    touchpad=$(xinput list-props "$DEVICE" | grep "Device Enabled" | grep -o "[01]$")
    tp_state=$(echo $touchpad | sed 's/1/enable/' | sed 's/0/disable/')
}

i3_out() {
    get_state
    state=$(echo $touchpad | sed 's/1/ON/' | sed 's/0/OFF/')
    echo $state > $STATUS_FILE
}

auto_detect() {
    get_state

    if [ "$mouse" != "$prv_mouse" ];
    then
        tp_state=$(echo $mouse | sed 's/0/enable/' | sed 's/1/disable/')
        xinput $tp_state "$DEVICE"
        notify-send "Touchpad" "Mouse was $m_state so $DEVICE is $tp_state"d
        i3_out
    fi

    prv_mouse=$mouse
}

manual_toggle() {
    get_state

    if [ "$mouse" = "0" ];
    then
        return 0
    fi

    tp_state=$(echo $touchpad | sed 's/0/enable/' | sed 's/1/disable/')    
    xinput $tp_state "$DEVICE"
    notify-send "Touchpad" "$DEVICE is $tp_state"d
    prv_mouse=$mouse
    i3_out
}

init() {

    # Enable touchpad tap to click on start up
    xinput set-prop "$DEVICE" "libinput Tapping Enabled" 1

    # Init parameters
    get_state
    prv_mouse=$(echo $mouse | sed 's/0/1/' | sed 's/1/0/')
}

if [ "$1" = "t" ];
then
    manual_toggle
else 
    init

    while :
    do
        auto_detect
        sleep 1
    done
fi
