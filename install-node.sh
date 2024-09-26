#!/bin/bash
# Script to install the latest Node.js, npm, and Yarn on Ubuntu
# Update the system
sudo apt-get update
# Install curl if not installed
sudo apt-get install -y curl
# Get the latest version of Node.js from NodeSource
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
# Install Node.js and npm (npm is bundled with Node.js)
sudo apt-get install -y nodejs
# Install Yarn package manager
sudo npm install --global yarn
# Verify installations
echo "Node.js version: $(node -v)"
echo "NPM version: $(npm -v)"
echo "Yarn version: $(yarn -v)"
echo "Node.js, npm, and Yarn installation completed"
echo "installation completed successfully!"
