#!/bin/bash

echo
echo "======================================================================"
echo "Automated Elecom Huge Trackball Mouse Map Script"
echo "===================================================================="
echo

# Find the mouse ID for the specific ELECOM TrackBall Mouse HUGE TrackBall (pointer)
mouse_id=$(xinput --list | grep -P '^⎜\s+↳ ELECOM TrackBall Mouse HUGE TrackBall\s+.*\s\[slave\s+pointer\s+\(2\)\]' | grep -oP 'id=\K[0-9]+')

if [ -z "$mouse_id" ]; then
    echo "Error: ELECOM TrackBall Mouse HUGE TrackBall (pointer) not found."
    exit 1
fi

echo "Mouse ID identified as: $mouse_id"

# Apply the button mapping
echo "Applying button mapping..."
xinput set-button-map $mouse_id 1 2 3 4 5 6 7 8 9 10 11 3

if [ $? -eq 0 ]; then
    echo "Button mapping applied successfully."
    notify-send "Mouse Button Mapping Applied" "ELECOM Trackball Mouse remapped successfully."
else
    echo "Failed to apply button mapping."
    exit 1
fi

echo 
echo "Thank you! Have a pleasant day :-)"
