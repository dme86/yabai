#!/bin/bash

# Check if multiple displays are connected
check_multiple_displays() {
    num_displays=$(yabai -m query --displays | jq 'length')
    if [ "$num_displays" -gt 1 ]; then
        return 0  # Multiple displays
    elif [ "$num_displays" -eq 1 ]; then
        return 1  # Single display (Macbook only)
    else
        return 2  # No displays O_o
    fi
}

main() {
    if check_multiple_displays; then
        # Create space on external monitor
        yabai -m space --create 1
	echo "create 2"
    elif [ "$?" -eq 1 ]; then
        # Create space on MacBook
	echo "create single"
        yabai -m space --create
    else
        echo "No displays found."
    fi
}

# Execute main function
main
