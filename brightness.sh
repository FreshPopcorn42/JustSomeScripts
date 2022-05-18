#!/bin/bash

currentBrightness = $(xrandr --pop --verbose | grep -LVDs-1 "connected" | grep "Brightness")

printf "Current brightness: $currentBrightness \n new brightness:"
read brightness

xrandr --output LVDS-1 --brightness $brightness
