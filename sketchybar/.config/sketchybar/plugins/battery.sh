#!/usr/bin/env bash

PERCENT=$(pmset -g batt | grep -Eo "\d+%")

sketchybar --add item battery right \
  --set battery \
    icon="🔋" \
    label="$PERCENT" \
    icon.color=$GREEN \
    label.color=$FG \
    update_freq=60

