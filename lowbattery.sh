#!/bin/bash

BATINFO=`acpi -b`

PERCENT=`echo $BATINFO | cut -f 4 -d " " | cut -f 1 -d "%"`

#echo $PERCENT
#echo $BATINFO

if [[ `echo $BATINFO | grep Discharging` ]]; then
		if [[ $PERCENT -le 7 ]]; then
				systemctl hibernate
		elif [[ $PERCENT -le 20 ]]; then
			echo "log: sending low battery notification"
				sudo -u crether DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus /usr/bin/notify-send "low battery" "plug SE laptop innnnnn!!!!"
		else
				echo "else"
		fi
fi

