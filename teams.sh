#!/usr/bin/env bash

# switching to teams and muting/unmuting
ID=$(xwininfo -name "Microsoft Teams" | head -2 | tail -1 | cut -d" " -f4)
if [[ -z ID ]]
then
  ID=$(xwininfo -name "Meeting | Microsoft Teams" | head -2 | tail -1 | cut -d" " -f4)
fi
# xdotool windowactivate --sync $ID
echo $ID
i3-msg "[id=\"$ID\"] focus"
xdotool key --clearmodifiers "ctrl+shift+m"

