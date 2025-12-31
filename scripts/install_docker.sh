#!/bin/bash

echo "Updating system..."
sudo apt update -y

echo "Installing Docker..."
sudo apt install docker.io docker-compose -y

echo "Starting Docker..."
sudo systemctl start docker
sudo systemctl enable docker

echo "Docker installed successfully!"
docker --version
docker-compose --version
