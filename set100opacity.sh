#!/usr/bin/env bash

picom-trans -w "$(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2)" -o 100
