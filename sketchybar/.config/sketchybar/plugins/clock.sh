#!/bin/bash
# Clock — updates on a fixed cycle (update_freq in sketchybarrc).
sketchybar --set "$NAME" label="$(date '+%a %d %b  %H:%M')"
