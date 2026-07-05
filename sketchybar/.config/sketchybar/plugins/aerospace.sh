#!/bin/bash
# Highlights the focused AeroSpace workspace.
# Runs on load and on the custom aerospace_workspace_change event (pushed from
# aerospace.toml's exec-on-workspace-change). $NAME is space.<sid>.
source "$HOME/.config/sketchybar/colors.sh"

FOCUSED="$(aerospace list-workspaces --focused 2>/dev/null)"
SID="${NAME#space.}"

if [ "$SID" = "$FOCUSED" ]; then
  # Active: silver highlight, dark glyph
  sketchybar --set "$NAME" \
    background.color="$ACCENT" \
    background.border_color="$ACCENT" \
    icon.color="$ACCENT_TEXT"
else
  # Inactive: dim pill, muted glyph
  sketchybar --set "$NAME" \
    background.color="$ITEM_BG" \
    background.border_color="$BORDER_COLOR" \
    icon.color="$FG_MUTED"
fi
