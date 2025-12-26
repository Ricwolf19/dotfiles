#!/usr/bin/env bash

# For each workspace from 1 to 5:
for i in 1 2 3 4 5; do
    sketchybar --add item ws_$i left \
        --set ws_$i \
            label="$i" \
            label.font="$FONT_LARGE" \
            label.color=$MUTED \
            padding_left=10 \
            padding_right=10 \
            click_script="aerospace workspace $i" \
            script="$PLUGIN_DIR/ws_update.sh $i" \
        --subscribe ws_$i aerospace_workspace_change
done

