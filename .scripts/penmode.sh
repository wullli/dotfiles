#!/bin/sh
if [ -z "$PENMODE" ]
then
export PENMODE=0
fi
if [ $(echo "$PENMODE" | bc) -eq 0 ]
then
xrandr -o 3
xsetwacom set stylus Rotate cw
export PENMODE=1

else
xrandr -o 0
xsetwacom set stylus Rotate none
export PENMODE=0
fi