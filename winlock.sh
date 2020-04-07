#/usr/bin/env bash
theme_rc="$HOME/.config/betterlockscreenrc"
if [ -e $theme_rc ];
then
     source "$theme_rc"
fi

i3lock \
  -i "$HOME/Pictures/win.png" -p win \
#  --timepos='x+110:h-70' \
#  --datepos='x+43:h-45' \
#  --clock --date-align 1 --datestr "$locktext" \
#  --insidecolor=$insidecolor --ringcolor=$ringcolor --line-uses-inside \
#  --keyhlcolor=$keyhlcolor --bshlcolor=$bshlcolor --separatorcolor=$separatorcolor \
#  --insidevercolor=$insidevercolor --insidewrongcolor=$insidewrongcolor \
#  --ringvercolor=$ringvercolor --ringwrongcolor=$ringwrongcolor --indpos='x+280:h-70' \
#  --radius=20 --ring-width=4 --veriftext='' --wrongtext='' \
#  --verifcolor="$verifcolor" --timecolor="$timecolor" --datecolor="$datecolor" \
#  --noinputtext='' --force-clock $lockargs
#
