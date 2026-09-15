#!/bin/bash

readarray -t MONITORS < <(hyprctl -j monitors | jq -r '.[].name' | grep -v "eDP-1")

hyprctl eval "
    hl.workspace_rule({ workspace=1,  monitor = \"eDP-1\" })
    hl.workspace_rule({ workspace=2,  monitor = \"eDP-1\" })
    hl.workspace_rule({ workspace=3,  monitor = \"eDP-1\" })
    hl.workspace_rule({ workspace=4,  monitor = \"eDP-1\" })
    hl.workspace_rule({ workspace=5,  monitor = \"eDP-1\" })
    hl.workspace_rule({ workspace=6,  monitor = \"${MONITORS[0]}\" })
    hl.workspace_rule({ workspace=7,  monitor = \"${MONITORS[0]}\" })
    hl.workspace_rule({ workspace=8,  monitor = \"${MONITORS[0]}\" })
    hl.workspace_rule({ workspace=9,  monitor = \"${MONITORS[0]}\" })
    hl.workspace_rule({ workspace=10, monitor = \"${MONITORS[0]}\" })
"
