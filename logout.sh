#!/usr/bin/env bash

if [ "$WM" = "KDE" ]
then
  qdbus org.kde.ksmserver /KSMServer logout 0 3 3
elif [ "$WM" = "i3" ]
then
  i3msg exit
else
  qdbus org.kde.ksmserver /KSMServer logout 0 3 3
fi
