#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or using sudo."
    exit 1
fi

# List of apt packages to install
apt_apps_to_install=(
    "git"
    # Add more apt applications as needed
)

# List of Snap packages to install
snap_apps_to_install=(
    "brave"
    "steam"
    "code"
    # Add more Snap applications as needed
)

# Update package lists
apt update

# Install GPU drivers
ubuntu-drivers install

# Check if GPU driver installation was successful
gpu_driver_status=$?
if [ "$gpu_driver_status" -eq 0 ]; then
    echo "GPU driver installation successful."
else
    echo "Failed to install GPU drivers. Please check for errors above."
    exit 1
fi

# Install apt packages
for app in "${apt_apps_to_install[@]}"; do
    apt install -y "$app"
done

# Install Snap packages
for app in "${snap_apps_to_install[@]}"; do
    snap install "$app"
done

echo "Installation of specified applications completed."
