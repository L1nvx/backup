#!/bin/bash


if [[ -d /sys/class/net/tun0 ]]; then

	ip=$(ip address show tun0 | grep -oP "[\d]+\..+?/" | cut -d / -f1)
	echo " $ip"
else
	echo " Offline"
fi
