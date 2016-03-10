#!/bin/bash

DOCKED=$(cat /sys/devices/platform/dock.2/docked)

case "$DOCKED" in
"1")
	#Docked!
	xrandr --output HDMI2 --auto --primary
	xrandr --output LVDS1 --off
	xrandr --output VGA1 --auto --left-of HDMI2 --rotate left
	;;
"0")
	#Undock!
	xrandr --output HDMI2 --off
	xrandr --output LVDS1 --auto --primary
	xrandr --output VGA1 --off
	;;
esac

setxkbmap se
xrandr --dpi 100
