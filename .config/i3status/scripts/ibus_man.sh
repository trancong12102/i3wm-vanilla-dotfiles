#!/bin/bash

## Created by nopain

STATUS_FILE=~/.config/i3status/status/ibus

switch() {
	## switch input method
	current=$(ibus engine)

	if [ "$current" = "Bamboo" ];
	then
		ibus engine xkb:us::eng
	else
		ibus engine Bamboo
	fi
	
	current=$(ibus engine)
	
	echo $current > $STATUS_FILE
}

if [ "$1" = "i" ];
then
    current="xkb:us::eng"
	echo $current > $STATUS_FILE
	ibus engine $current
fi

if [ "$1" = "s" ];
then
    switch
fi
