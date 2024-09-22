#!/bin/bash

# Check if the script is run in the root of the repository
if [ ! -f .gitmodules ]; then
    echo "No .gitmodules file found."
    echo "Here's an example of how to create a basic .gitmodules file in the root of your repository:"
    echo ""
    echo "[submodule \"<service_name>\"]"
    echo "    path = <service_name>"
    echo "    url = https://github.com/your-username/<service_name>.git"
    echo ""
    echo "To add a submodule, use the following command:"
    echo "git submodule add https://github.com/your-username/<service_name>.git <service_name>"
    exit 1
fi

# Initialize and update all submodules
echo "Initializing and updating submodules..."
git submodule init
git submodule update --recursive

# List all submodule URLs
echo "Listing submodule URLs..."
git config --file .gitmodules --get-regexp url

echo "All submodules pulled and listed successfully."
