#!/bin/bash

# Check if Snap is installed
if ! command -v snap &> /dev/null; then
    echo "Snap is not installed. Please install Snap before running this script."
    exit 1
fi

# Install Brave using Snap
sudo snap install brave

# Check if installation was successful
if command -v brave &> /dev/null; then
    echo "Brave browser has been successfully installed."
else
    echo "Failed to install Brave browser. Please check for errors above."
    exit 2
fi

# Display information about launching Brave
echo "You can launch Brave browser by running 'brave' in the terminal."
