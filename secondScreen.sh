#!/usr/bin/env bash

MONITOR=$1 polybar --reload -c "$HOME/.config/polybar/config.ini" top &
echo $MONITOR
