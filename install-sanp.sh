#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or using sudo."
    exit 1
fi

# List of Snap packages to install
snap_apps_to_install=(
    "brave"
    "steam"
    "code"
    # Add more Snap applications as needed
)

# Update package lists
apt update

# Install Snap packages
for app in "${snap_apps_to_install[@]}"; do
    snap install "$app"
done

echo "Installation of specified applications completed."
