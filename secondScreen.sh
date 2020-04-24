#!/usr/bin/env bash

MONITOR=$1 polybar --config="$HOME/.config/polybar/config.ini" top &
