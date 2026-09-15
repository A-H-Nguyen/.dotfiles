#!/bin/bash

# This script only ever enables/disables eDP-1 (the internal panel). External
# monitor layout is declared statically in hyprland.lua so Hyprland applies it
# itself whenever those monitors connect -- this script never touches it.
#
# It uses `hl.workspace_rule` (persistent rule, same idea as the old
# `hyprctl keyword workspace "N, monitor:X"`) rather than
# `hl.dsp.workspace.move` (a one-shot dispatch). The dispatch form doesn't
# update the persistent binding, so it can get silently overridden the next
# time Hyprland re-evaluates workspace rules on a monitor event.

ANCOR_DESC="Ancor Communications Inc VS24A E6LMQS098584"
DELL_DESC="Dell Inc. DELL U2412M M2GCR24R314L"

readarray -t MONITORS < <(hyprctl -j monitors | jq -r '.[].name' | grep -v "eDP-1")

if [[ $1 == "close" ]]; then
    # This is specifically for my setup in the grad student office
    if hyprctl -j monitors | jq -r '.[].description' | grep -q "$ANCOR_DESC" &&
        hyprctl -j monitors | jq -r '.[].description' | grep -q "$DELL_DESC"; then
        hyprctl eval "hl.monitor({output = \"eDP-1\", disabled = true})"
        hyprctl eval "
            hl.workspace_rule({ workspace=1,  monitor = \"desc:$ANCOR_DESC\" })
            hl.workspace_rule({ workspace=2,  monitor = \"desc:$ANCOR_DESC\" })
            hl.workspace_rule({ workspace=3,  monitor = \"desc:$ANCOR_DESC\" })
            hl.workspace_rule({ workspace=4,  monitor = \"desc:$ANCOR_DESC\" })
            hl.workspace_rule({ workspace=5,  monitor = \"desc:$ANCOR_DESC\" })
            hl.workspace_rule({ workspace=6,  monitor = \"desc:$DELL_DESC\" })
            hl.workspace_rule({ workspace=7,  monitor = \"desc:$DELL_DESC\" })
            hl.workspace_rule({ workspace=8,  monitor = \"desc:$DELL_DESC\" })
            hl.workspace_rule({ workspace=9,  monitor = \"desc:$DELL_DESC\" })
            hl.workspace_rule({ workspace=10, monitor = \"desc:$DELL_DESC\" })
        "

    # The case where we have a SINGLE external monitor plugged in either the
    # dedicated HDMI port, or through the USB C port
    elif [[ ${#MONITORS[@]} -eq 1 ]]; then
        hyprctl eval "hl.monitor({output = \"eDP-1\", disabled = true})"
        hyprctl eval "
            for i = 1, 10 do
                hl.workspace_rule({ workspace = i, monitor = \"${MONITORS[0]}\" })
            end
        "
    else
        # suspend and hiberante on lid-close doesn't fucking work
        # loginctl lock-session
        systemctl hibernate
    fi
elif [[ $1 == "open" ]]; then
    hyprctl eval "hl.monitor({output = \"eDP-1\", disabled = false, mode = \"1920x1080@60\", position = \"auto\", scale = 1})"

    # Only reclaim workspaces onto eDP-1 if we're fully undocked. If an
    # external monitor is still attached, leave its workspace assignment
    # alone -- eDP-1 just becomes an extra screen.
    if [[ ${#MONITORS[@]} -eq 0 ]]; then
        hyprctl eval "
            for i = 1, 10 do
                hl.workspace_rule({ workspace = i, monitor = \"eDP-1\" })
            end
        "
    fi
else
    notify-send "What?"
fi
