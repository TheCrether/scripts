#!/usr/bin/env bash
# just a simple bash script to do a command for every line of a file
# useful for downloading a list with youtube-dl for example

while read in
do
  $@ "$in"
done
