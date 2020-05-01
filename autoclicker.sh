#!/usr/bin/env bash

# a autoclicker for Minecraft
# by @TheCrether

# get window to autoclick in
ID=$(xwininfo | head -2 | tail -1 | cut -d" " -f4)

case "$1" in
  hold)
	case "$2" in
	  left)
		xdotool mousedown --window "$ID" 1
		# idle waiting for abort from user
		read -r -d '' _ </dev/tty
		xdotool mouseup --window "$ID" 1
		;;
	  right)
		xdotool mousedown --window "$ID" 3
		# idle waiting for abort from user
		read -r -d '' _ </dev/tty
		xdotool mouseup --window "$ID" 3
		;;
	esac
	;;
  click)
	case "$2" in
	  left)
		while [ 1 ]; do
		  w=`xdotool getactivewindow`
		  xdotool click --window "$ID" 1
		  sleep 0.1
		done
		;;
	  right)
		while [ 1 ]; do
		  w=`xdotool getactivewindow`
		  xdotool click --window "$ID" 3 &
		  sleep 0.1
		done
		;;
	esac
	;;
esac
