#!/bin/bash
# Vesper palette for SketchyBar — single source of truth for colors.
# ARGB hex (0xAARRGGBB). Derived from the Vesper theme used across Ghostty/Herdr.

# Base surfaces
export BAR_COLOR=0xcc101010       # bar background — Vesper black, ~80% opaque
export BG_TRANSPARENT=0x00000000
export ITEM_BG=0xff1c1c1c         # item pill background — slightly lifted black

# Text / foreground
export WHITE=0xffffffff           # primary text
export FG_MUTED=0xffa0a0a0        # secondary / inactive text (Vesper gray)

# Accents (Vesper)
export SILVER=0xffc0c0c0          # silver — matches JankyBorders active border
export PEACH=0xffffc799           # Vesper peach/orange — warm accent
export GREEN=0xff99ffe4           # Vesper mint — success/charging
export RED=0xffff8080             # Vesper red — warnings/low battery

# Active vs inactive workspace
export ACCENT=$SILVER             # active workspace highlight
export ACCENT_TEXT=0xff101010     # text on the active (silver) highlight

# Borders
export BORDER_COLOR=0xff2a2a2a    # subtle item border
