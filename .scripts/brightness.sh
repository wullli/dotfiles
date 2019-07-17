#!/bin/sh
file="$HOME/.scripts/brightness.config"
CURRBRIGHT=$(cat "$file")
echo "$CURRBRIGHT"
if [ "$1" = "+" ] && [ $(echo "$CURRBRIGHT < 1" | bc) -eq 1 ]
then
CURRBRIGHT=$(echo "$CURRBRIGHT + 0.1" | bc)
echo "$CURRBRIGHT"
xrandr --output $2 --brightness $(echo "$CURRBRIGHT")
elif [ "$1" = "-" ] && [ $(echo "$CURRBRIGHT > 0" | bc) -eq 1 ]
then
CURRBRIGHT=$(echo "$CURRBRIGHT - 0.1" | bc)
echo "$CURRBRIGHT"
xrandr --output $2 --brightness $(echo "$CURRBRIGHT")
else
xrandr --output $2 --brightness $(echo "$CURRBRIGHT")
fi
echo "$CURRBRIGHT" > "$file"
