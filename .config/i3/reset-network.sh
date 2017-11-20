#!/usr/bin/env bash

sudo netctl stop-all
sleep 2
sudo systemctl reset-failed
sleep 1
sudo ip link set wlp2s0 down

iplink=$( cat /sys/class/net/wlp2s0/operstate )

if [ $iplink = 'up' ]; then
    sudo ip link set wlp2s0 down
fi

#home=$(netctl is-active wlp2s0-comhem_AE861F-5G)
#school=$(netctl is-active wlp2s0-eduroam)

if [ $1 = 'home' ]; then
    isactive=$(netctl is-active wlp2s0-comhem_AE861F-5G)
    if [$isactive='active']; then
        dunstify 'restart' 'wlp2s0-comhem_AE861F-5G'
        sudo netctl restart wlp2s0-comhem_AE861F-5G
    else
        dunstify 'starting' 'wlp2s0-comhem_AE861F-5G'
        sudo netctl start wlp2s0-comhem_AE861F-5G
    fi
elif [ $1 = 'school' ]; then
    isactive=$(netctl is-active wlp2s0-eduroam)
    if [$isactive='active']; then
        dunstify 'restart' 'wlp2s0-eduroam'
        sudo netctl restart wlp2s0-eduroam
    else
        dunstify 'starting' 'wlp2s0-eduroam'
        sudo netctl start wlp2s0-eduroam
    fi
else
    dunstify 'Failed to start any network interface' ''
fi


