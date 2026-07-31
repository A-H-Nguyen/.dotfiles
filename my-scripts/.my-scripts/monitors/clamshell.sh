#!/bin/sh

# DESC=$(hyprctl -j monitors | jq -r '.[].description')
# NAME=$(hyprctl -j monitors | jq -r '.[].name')
# echo $DESC
# echo $NAME

readarray -t MONITORS < <(hyprctl -j monitors | jq -r '.[].name' | grep -v "eDP-1")

if [[ $1 == "close" ]]; then
    # This is specifically for my setup in the grad student office
    if hyprctl -j monitors | jq -r '.[].description' | grep -q "Ancor Communications Inc VS24A E6LMQS098584" &&
       hyprctl -j monitors | jq -r '.[].description' | grep -q "Dell Inc. DELL U2412M M2GCR24R314L"; then
        $HOME/.my-scripts/monitors/external-dual
        hyprctl keyword monitor "eDP-1,disable"

    # The case where we have a SINGLE external monitor plugged in either the 
    # dedicated HDMI port, or through the USB C port
    elif [[ ${#MONITORS[@]} -eq 1 ]]; then 
        $HOME/.my-scripts/monitors/external-single ${MONITORS[0]}
        hyprctl eval "hl.monitor({output = \"${MONITORS[0]}\", mode = \"preferred\", position = \"auto\", scale = 1,})"
        hyprctl eval 'hl.monitor({output = "eDP-1", disabled = true})'
    else
        # suspend and hiberante on lid-close doesn't fucking work
        # loginctl lock-session
        systemctl hibernate
    fi
elif [[ $1 == "open" ]]; then
    hyprctl eval "hl.monitor({output = \"eDP-1\", disabled = false, mode = \"1920x1080@60\", position = \"auto\", scale = 1,})"
else
    notify-send "What?"
fi
