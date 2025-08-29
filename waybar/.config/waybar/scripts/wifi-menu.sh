#!/bin/bash

# Function to get available WiFi networks
get_wifi_networks() {
    # Try nmcli first (NetworkManager)
    if command -v nmcli &> /dev/null; then
        nmcli -f SSID,SECURITY,BARS device wifi list | \
        awk 'NR>1 { 
            # Extract signal strength and security type
            sec = $2; 
            bars = $3; 
            # Reconstruct SSID (might have spaces)
            ssid = $1; 
            for (i=4; i<=NF; i++) {
                if ($i ~ /^[A-Z]+$/) {
                    sec = sec " " $i;
                } else if ($i ~ /^▂+$/) {
                    bars = $i;
                } else {
                    ssid = ssid " " $i;
                }
            }
            # Map bars to icons
            if (bars ~ /▂▂▂▂/) sig_icon="󰤨";
            else if (bars ~ /▂▂▂/) sig_icon="󰤥";
            else if (bars ~ /▂▂/) sig_icon="󰤢";
            else if (bars ~ /▂/) sig_icon="󰤟";
            else sig_icon="󰤯";
            
            # Map security to icons
            if (sec ~ /WPA2/) sec_icon="󰣇";
            else if (sec ~ /WPA/) sec_icon="󰣇";
            else if (sec ~ /WEP/) sec_icon="󰣇";
            else sec_icon="󰣄";
            
            printf "%s %s %s\n", sig_icon, sec_icon, ssid;
        }' | sort -u
    # Try iwctl next (iwd)
    elif command -v iwctl &> /dev/null; then
        iwctl station wlan0 get-networks | awk '/>/ {print "󰤨 󰣄 " $4}' | head -n 10
    # Fallback to basic listing
    else
        echo "󰤯  󰣇  No WiFi manager found"
        echo "󰤯  󰣇  Install NetworkManager or iwd"
    fi
}

# Function to connect to a network
connect_to_network() {
    local ssid="$1"
    
    if command -v nmcli &> /dev/null; then
        # If network is secured, prompt for password
        if nmcli -f SECURITY dev wifi list | grep -q "WPA" | head -1; then
            password=$(rofi -dmenu -p "Password for $ssid" -password -theme ~/.config/rofi/catppuccin-lavrent-mocha.rasi)
            if [ -n "$password" ]; then
                nmcli device wifi connect "$ssid" password "$password"
            fi
        else
            nmcli device wifi connect "$ssid"
        fi
    elif command -v iwctl &> /dev/null; then
        iwctl station wlan0 connect "$ssid"
    fi
}

# Function to toggle WiFi
toggle_wifi() {
    if command -v nmcli &> /dev/null; then
        current_state=$(nmcli radio wifi)
        if [ "$current_state" = "enabled" ]; then
            nmcli radio wifi off
            notify-send "WiFi" "Disabled"
        else
            nmcli radio wifi on
            notify-send "WiFi" "Enabled"
        fi
    elif command -v iwctl &> /dev/null; then
        iwctl device list | grep -q "powered on"
        if [ $? -eq 0 ]; then
            iwctl device wlan0 set-property Powered off
            notify-send "WiFi" "Disabled"
        else
            iwctl device wlan0 set-property Powered on
            notify-send "WiFi" "Enabled"
        fi
    fi
}

# Get current WiFi status
if command -v nmcli &> /dev/null; then
    current_ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)
    connected_icon="󰤨"
elif command -v iwctl &> /dev/null; then
    current_ssid=$(iwctl station wlan0 show | grep "Connected network" | awk '{print $3}')
    connected_icon="󰤨"
else
    current_ssid="Not connected"
    connected_icon="󰤯"
fi

# Create menu options
menu_options=" Toggle WiFi\n Refresh Networks\n────────────────────"

# Add available networks
if [ "$1" != "toggle" ]; then
    wifi_networks=$(get_wifi_networks)
    menu_options="$menu_options\n$wifi_networks"
fi

# Show menu and get selection
selected=$(echo -e "$menu_options" | rofi -dmenu -p "  WiFi: ${current_ssid:-Not connected}" \
    -theme ~/.config/rofi/menu.rasi \
    -show-icons \
    -location 1 \
    -x $X_POS \
    -y $Y_POS \
    -width $MENU_WIDTH \
    -lines 10)

# Handle selection
case "$selected" in
    " Toggle WiFi")
        toggle_wifi
        ;;
    " Refresh Networks")
        # Restart the script to refresh networks
        exec "$0"
        ;;
    "────────────────────")
        # Do nothing for separator
        ;;
    *)
        # Try to connect to selected network (remove icons and get SSID)
        if [ -n "$selected" ]; then
            ssid=$(echo "$selected" | awk '{for(i=3;i<=NF;i++) printf $i (i==NF?"\n":" ")}')
            if [ -n "$ssid" ] && [ "$ssid" != "No WiFi manager found" ]; then
                connect_to_network "$ssid"
            fi
        fi
        ;;
esac
