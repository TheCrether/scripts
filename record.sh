#!/usr/bin/env bash

case "$1" in
  record)
	OFFSET="0:0"
	if [[ $# -lt 5 ]] || [[ $# -gt 6 ]]; then
	  echo "Wrong number of arguments! Look: at `${0##*/} help` for help"
	fi
	if [[ $# -eq 6 ]]; then
	  OFFSET=$6
	fi
	echo $OFFSET
	ffmpeg -f x11grab -framerate $2 -video_size $3 -i $DISPLAY.$4+$OFFSET $5
	;;

  help | --help | *)
	echo "Usage: ${0##*/} [help | record] framerate video_size displaynumber output [offset]"
	echo
	echo "If help or record is not specified, it will default to help"
	echp "When its time to stop the recording, you need to press Ctrl+C in your terminal, ffmpeg will save the file"
	echo "Options:"
	echo "  help: Outputs this help info"
	echo "  record: starts recording"
	echo
	echo "Arguments:"
	echo "  framerate: the framerate you want the recording to have, example: 60"
	echo "  video_size: how big the display is you want to record, example: 1920x1080"
	echo "  displaynumber: the display number of the display you want to record, example: 0 (for display 0)"
	echo "    if you use i3 or something else which makes two display appear as one, specify the offset"
	echo "  output: the path of the output file, example: out.mp4"
	echo
	echo "This uses ffmpeg in the background so you need to have ffmpeg installed and libxcb for recording"
	;;

esac
