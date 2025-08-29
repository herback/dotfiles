#!/bin/bash

# Define the options with icons
options="󰌾 Lock\n󰒲 Suspend\n󰤄 Hibernate\n󰜉 Reboot\n󰐥 Shutdown\n󰗽 Logout"


# Show rofi menu using the dedicated theme
selected=$(echo -e "$options" | rofi -dmenu -p "󰀓" \
    -theme ~/.config/rofi/menu.rasi \
    -show-icons)

# Execute the selected action
case "$selected" in
    "󰌾 Lock")
        hyprlock
        ;;
    "󰒲 Suspend")
        systemctl suspend
        ;;
    "󰤄 Hibernate")
        systemctl hibernate
        ;;
    "󰜉 Reboot")
        systemctl reboot
        ;;
    "󰐥 Shutdown")
        systemctl poweroff
        ;;
    "󰗽 Logout")
        exit
        ;;
esac
