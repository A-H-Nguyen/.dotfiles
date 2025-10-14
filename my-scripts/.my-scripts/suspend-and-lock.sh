#!/bin/sh

pidof hyprlock || hyprlock & disown && systemctl suspend

