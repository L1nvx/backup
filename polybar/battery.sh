#!/bin/bash


battery_percentage=$(cat /sys/class/power_supply/BAT0/capacity)

echo " $battery_percentage%"

