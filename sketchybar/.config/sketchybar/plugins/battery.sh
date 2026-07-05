#!/bin/bash
# Battery — icon + percentage, color-coded. Uses Vesper accents.
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

PERCENT="$(pmset -g batt | grep -Eo '[0-9]+%' | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ -z "$PERCENT" ]; then
  exit 0
fi

if [ -n "$CHARGING" ]; then
  ICON="$ICON_BATTERY_CHARGING"; COLOR="$GREEN"
else
  case "$PERCENT" in
    100|9[0-9]|8[0-9]|7[5-9]) ICON="$ICON_BATTERY_FULL"; COLOR="$WHITE" ;;
    7[0-4]|6[0-9]|5[0-9]|50)  ICON="$ICON_BATTERY_75";   COLOR="$WHITE" ;;
    4[0-9]|3[0-9]|2[5-9])     ICON="$ICON_BATTERY_50";   COLOR="$PEACH" ;;
    2[0-4]|1[0-9]|1[0-5])     ICON="$ICON_BATTERY_25";   COLOR="$PEACH" ;;
    *)                        ICON="$ICON_BATTERY_LOW";  COLOR="$RED"   ;;
  esac
fi

sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR" label="${PERCENT}%"
