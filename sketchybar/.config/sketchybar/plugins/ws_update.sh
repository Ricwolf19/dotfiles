#!/usr/bin/env bash

FOCUSED="$INFO"
INDEX="$1"

if [ "$FOCUSED" = "$INDEX" ]; then
  sketchybar --set ws_$INDEX \
    label.color=$PURPLE
else
  sketchybar --set ws_$INDEX \
    label.color=$MUTED
fi

