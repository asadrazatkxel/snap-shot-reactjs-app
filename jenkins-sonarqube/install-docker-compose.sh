#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first."
    exit 1
fi

#COMPOSE_VERSION="v2.18.1"
#echo "Downloading Docker Compose version $COMPOSE_VERSION..."
#curl -SL "https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# version 1.29.2-1
sudo apt  install docker-compose

echo "Verifying Docker Compose installation..."
docker-compose --version

echo "Docker Compose installation completed successfully!"
