#!/bin/bash
#!/usr/bin/env bash

########################################
#        Node Installer (v1.0)         #
#        Copyright 2024, Venix         #
#  Not associated with offical NodeJS  #
########################################

if command -v node &> /dev/null
then
    CURRENT_NODE_VERSION=$(node -v)
    echo "Node.js is already installed. Current version: $CURRENT_NODE_VERSION"
    read -p "Do you want to remove the current Node.js version and install a new one? (y/n): " change_version

    if [[ "$change_version" != "y" && "$change_version" != "Y" ]]; then
        echo "Exiting without changes."
        exit 0
    fi
    echo "Removing current Node.js version..."
    sudo apt remove -y nodejs

    echo "Cleaning up..."
    sudo apt autoremove -y
    sudo apt purge -y nodejs
else
    echo "Node.js is not installed."
fi

echo "Which version of Node.js would you like to install?"
echo "1) Node.js v16"
echo "2) Node.js v18"
echo "3) Node.js v20"
echo "4) Node.js v22"
read -p "Enter the number corresponding to your choice (1, 2, 3 or 4): " version_choice

case $version_choice in
    1)
        NODE_VERSION="16.x"
        ;;
    2)
        NODE_VERSION="18.x"
        ;;
    3)
        NODE_VERSION="20.x"
        ;;
    4)
        NODE_VERSION="22.x"
        ;;
    *)
        echo "Invalid choice. Exiting..."
        exit 1
        ;;
esac

echo "Downloading Node.js $NODE_VERSION setup script..."
curl -sL https://deb.nodesource.com/setup_$NODE_VERSION -o nodesource_setup.sh

echo "Running the Node.js setup script for version $NODE_VERSION..."
sudo bash nodesource_setup.sh

echo "Installing Node.js $NODE_VERSION..."
sudo apt install -y nodejs

echo "Node.js version:"
node -v
echo "NPM version:"
npm -v
