#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first."
    exit 1
fi

# Check if Nginx Proxy Manager container is running
if docker ps --format '{{.Names}}' | grep -q '^nginx-proxy-manager$'; then
    echo "Nginx Proxy Manager is already running."
    exit 0
fi

# Create a docker network if not exists
docker network create nginx-proxy-manager

# Run Nginx Proxy Manager container
sudo docker run -d -p 80:80 -p 81:81 -p 443:443 \
  --name=nginx-proxy-manager \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -v /mnt/npm/data:/data \
  jc21/nginx-proxy-manager:latest

# Display Nginx Proxy Manager access information
echo "Nginx Proxy Manager has been installed and is running."
echo "Access the management interface at http://localhost:81"

