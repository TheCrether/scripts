#!/bin/bash
CNT=1
for FILE in *.jpg; do
  mv $FILE "$CNT.jpg"
  ((CNT++))
done
