#!/usr/bin/env bash

sketchybar --add item window_title right \
  --set window_title \
    label.font="$FONT_REGULAR" \
    label.color=$FG \
    label.max_chars=50 \
    update_freq=1 \
    script='echo "$INFO"' \
  --subscribe window_title front_app_switched

