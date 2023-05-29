#!/bin/bash


if [[ -d /sys/class/net/wlan0 ]]; then

	ip=$(ip address show wlan0 | grep -oP "[\d]+\..+?/" | cut -d / -f1)
	echo " $ip"
else
	echo " Offline"
fi
