#!/usr/bin/env bash

CPU=$(top -l 1 | awk '/CPU usage/ {print $3 + $5 "%"}')

sketchybar --add item cpu right \
  --set cpu \
    icon="🧠" \
    label="$CPU" \
    icon.color=$BLUE \
    label.color=$FG \
    update_freq=3

