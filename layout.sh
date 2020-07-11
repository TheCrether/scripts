#!/usr/bin/env bash

CURRENT=$(xkblayout-state print "%s")

if [[ $CURRENT = "de" ]]; then
  setxkbmap us
else
  setxkbmap de
fi
