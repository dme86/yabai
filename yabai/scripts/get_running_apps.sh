#!/bin/bash

SPACE_ID=$(yabai -m query --spaces --space | jq '.index')
APPS=$(yabai -m query --windows --space $SPACE_ID | jq -r '.[].app')

icons=""

for app in $APPS; do
    case $app in
        "Finder")
            icons+="󰀶"
            ;;
        "Google Chrome")
            icons+="󰊯"
            ;;
        "Alacritty")
            icons+=" "
            ;;
        "Safari")
            icons+="S "
            ;;
        # Add more cases for other apps as needed
        *)
            icons+="󰘔 " # Default icon
            ;;
    esac
done

echo $icons
