#!/usr/bin/env bash
theme_rc="$HOME/.config/betterlockscreenrc"
if [ -e $theme_rc ];
then
     source "$theme_rc"
fi

i3lock \
  -i "$HOME/Pictures/win.png" -p win
