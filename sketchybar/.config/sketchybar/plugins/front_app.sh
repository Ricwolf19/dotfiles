#!/bin/bash
# Shows the currently focused application name.
# Triggered by the front_app_switched event.

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set "$NAME" label="$INFO"
fi
