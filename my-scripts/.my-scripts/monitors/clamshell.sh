#!/bin/sh

if [[ $1 == "close" ]]; then
    # This is specifically for the setup in the grad student office
    if hyprctl -j monitors | jq -r '.[].description' | grep -q "Ancor Communications Inc VS24A E6LMQS098584" &&
       hyprctl -j monitors | jq -r '.[].description' | grep -q "Dell Inc. DELL U2412M M2GCR24R314L"; then
        $HOME/.my-scripts/monitors/external-dual
        hyprctl keyword monitor "eDP-1,disable"
    # (hopefully) general for all HDMI monitors
    elif hyprctl -j monitors | jq -r '.[].name' | grep -q "HDMI-A-1"; then
        $HOME/.my-scripts/monitors/hdmi
        hyprctl keyword monitor "eDP-1,disable"
    else
        pidof hyprlock || hyprlock & disown && systemctl suspend
    fi
elif [[ $1 == "open" ]]; then
    hyprctl keyword monitor "eDP-1,1920x1080,auto,1"
else
    notify-send "What?"
fi
