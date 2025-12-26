#!/usr/bin/env bash

IFACE="en0"

RX=$(netstat -ibn | awk -v iface=$IFACE '$1==iface {rx+=$7} END {print rx}')
TX=$(netstat -ibn | awk -v iface=$IFACE '$1==iface {tx+=$10} END {print tx}')

sketchybar --add item network right \
  --set network \
    label="⬆ $TX ⬇ $RX" \
    label.color=$FG \
    update_freq=2

