#!/usr/bin/env bash

USED=$(vm_stat | awk '/Pages active/ {print int($3/256)"MB"}')

sketchybar --add item memory right \
  --set memory \
    icon="🧪" \
    label="$USED" \
    icon.color=$GREEN \
    label.color=$FG \
    update_freq=5

