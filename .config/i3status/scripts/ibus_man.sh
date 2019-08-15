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
	
	echo "$current" | sed 's/xkb:us::eng/EN/' | sed 's/Bamboo/VI/' > $STATUS_FILE
}

if [ "$1" = "i" ];
then
  current="xkb:us::eng"
	ibus engine $current
	echo "$current" | sed 's/xkb:us::eng/EN/' | sed 's/Bamboo/VI/' > $STATUS_FILE
fi

if [ "$1" = "s" ];
then
    switch
fi 
