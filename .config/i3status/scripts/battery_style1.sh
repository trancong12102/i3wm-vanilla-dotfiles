#!/bin/bash

## created by nopain

BGF_CHARGING="#94D183"
BG_CHARGING="#e5e9f0"

BGF_NORMAL="#86BAC8"
BG_NORMAL="#e5e9f0"

BGF_LOW="#FDD4C1"
BG_LOW="#FDD4C1"

BGF_CRITICAL="#EAABBC"
BG_CRITICAL="#EAABBC"


STATUS_FILE=~/.config/i3status/status/battery

AC="/sys/class/power_supply/AC/uevent"
SUP_ONL="POWER_SUPPLY_ONLINE="

BAT0="/sys/class/power_supply/BAT0/uevent"
BAT1="/sys/class/power_supply/BAT1/uevent"
ENE_NOW="POWER_SUPPLY_ENERGY_NOW="
ENE_FULL="POWER_SUPPLY_ENERGY_FULL="

PER_FULL=99
PER_LOW=20
PER_CRIT=10

i3_out() {
	echo "<span background='$bgf'>  $icon  <span background='$bg'>  $batf%  </span> </span>" > $STATUS_FILE
}

get_ene() {
	now=$(grep $ENE_NOW $1 | grep -o -E "[0-9]+")
	full=$(grep $ENE_FULL $1 | grep -o -E "[0-9]+")
}

get_bat() {
	get_ene $BAT0
	now0=$now
	full0=$full

	get_ene $BAT1
	now1=$now
	full1=$full

	batf=$(bc -l <<< "scale=2; ($now0 + $now1) * 100 / ($full0 + $full1)")
	bat=$(bc -l <<< "scale=0; ($batf + 0.5) / 1")
}

get_ac() {
	ac=$(grep $SUP_ONL $AC | grep -o -E "[0-9]+")
}

get_icon() {
	if [ $bat -lt 10 ];
	then
		icon=""
	elif [ $bat -lt 35 ];
	then
		icon=""
	elif [ $bat -lt 60 ];
	then
		icon=""
	elif [ $bat -lt 95 ];
	then
		icon=""
	else
		icon=""
	fi
}

get_state() {
	if [ $bat -lt $PER_CRIT ];
	then
		state="critical"
		bg=$BG_CRITICAL
		bgf=$BGF_CRITICAL
	elif [ $bat -lt $PER_LOW ];
	then
		state="low"
		bg=$BG_LOW
		bgf=$BGF_LOW
	else 
		state="normal"
		bgf=$BGF_NORMAL
		bg=$BG_NORMAL
	fi

	if [ $ac -eq 1 ];
	then
		icon=""
		state="charging"
		bgf=$BGF_CHARGING
		bg=$BG_CHARGING
	fi

	if [ $bat -gt $PER_FULL ] && [ $ac -eq 1 ];
	then
		state="full"
	fi
}

notify() {
	if [ "$state" != "$prv_state" ];
	then
		if [ "$state" = "low" ];
		then
			title="Your battery is running low ($bat%)"
			mess="You might want to plugin your PC"
			urgency="low"
		elif [ "$state" = "critical" ];
		then
			title="Laptop battery critically low ($bat%)"
			mess="Computer will turn off very soon unless it is plugged in"
			urgency="critical"
		elif [ "$state" = "full" ];
		then
			title="Laptop battery is fully charged"
			mess="Please unplugging"
			urgency="normal"
		else 
			title=''
			mess=''
			urgency=''
		fi

		if [ -n "$title" ];
		then
			notify-send "$title" "$mess" -u $urgency
		fi
	fi
	prv_state=$state
}

do_job() {
	get_bat
	get_ac
	get_icon
	get_state
	notify
}

init() {
	prv_state="normal"
}

######################################################

init 

while :
do
	do_job
	i3_out

	sleep 1
done

