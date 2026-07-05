#!/bin/bash
# Volume — icon reflects level, triggered by volume_change ($INFO = 0-100).
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

VOLUME="$INFO"
if [ -z "$VOLUME" ]; then
  VOLUME="$(osascript -e 'output volume of (get volume settings)' 2>/dev/null)"
fi

case "$VOLUME" in
  6[0-9]|7[0-9]|8[0-9]|9[0-9]|100) ICON="$ICON_VOLUME_HIGH" ;;
  3[0-9]|4[0-9]|5[0-9])            ICON="$ICON_VOLUME_MED"  ;;
  [1-9]|1[0-9]|2[0-9])             ICON="$ICON_VOLUME_LOW"  ;;
  *)                               ICON="$ICON_VOLUME_MUTE" ;;
esac

sketchybar --set "$NAME" icon="$ICON" icon.color="$SILVER" label="${VOLUME}%"
