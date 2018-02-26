#!/bin/bash

BATTINFO=`acpi -b`
STAT=`echo $BATTINFO | egrep -o 'Discharging'`
BAT=`echo $BATTINFO | egrep -o '[0-9]{1,2}%' | cut -d '%' -f 1`
ESHOLD=16
echo $BAT
if [ "$BAT" -le "$ESHOLD" ] && [ $STAT == 'Discharging' ]
then
     sudo -u erkan DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus /usr/bin/dunstify -u critical "LOW BATTERY" "$BAT %"
fi
