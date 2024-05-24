#!/bin/bash

# Get the space ID that has current focus
FOCUS_ID=$(yabai -m query --spaces | jq -r '.[] | select(.["has-focus"]) | .index')

# Query SketchyBar for the properties of space.FOCUS_ID
JSON_OUTPUT=$(sketchybar --query space.$FOCUS_ID)

# Extract the label.width value using jq
LABEL_WIDTH=$(echo "$JSON_OUTPUT" | jq -r '.label.width')

if [ "$LABEL_WIDTH" == "0" ]; then
  sketchybar --animate tanh 20 --set space.$FOCUS_ID icon.highlight=$FOCUS_ID label.width=dynamic
else
  sketchybar --animate tanh 20 --set space.$FOCUS_ID icon.highlight=$FOCUS_ID label.width=0
fi
