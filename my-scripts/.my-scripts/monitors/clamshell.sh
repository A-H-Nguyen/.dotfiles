#!/bin/sh

state=$(upower -i "$(upower -e | grep BAT)" | grep -E "state" | awk '{print $2}' | tr -d '%')

if [ "$state" = "discharging" ]; then
    if [[ $1 == "close" ]]; then
        pidof hyprlock || hyprlock & disown && systemctl suspend
    fi
else
    if [[ $1 == "open" ]]; then
        hyprctl keyword monitor "eDP-1,1920x1080,2560x0,1"
    else
        if hyprctl -j monitors | jq -r '.[].description' | grep -q "Ancor Communications Inc VS24A E6LMQS098584" &&
           hyprctl -j monitors | jq -r '.[].description' | grep -q "Dell Inc. DELL U2412M M2GCR24R314L"; then
            $HOME/.my-scripts/monitors/external-dual
        fi
        hyprctl keyword monitor "eDP-1,disable"
    fi
fi
