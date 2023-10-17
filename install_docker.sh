#!/bin/bash

# Update the package list
sudo apt-get update

# Install required packages to allow apt to use a repository over HTTPS
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the stable Docker repository
echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package list with the new repository
sudo apt-get update

# Install Docker engine
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Add your user to the docker group to run Docker commands without sudo
sudo usermod -aG docker $USER

# Enable Docker service to start on boot
sudo systemctl enable docker

# Display Docker version
docker --version

# Display Docker info
docker info

# Display Docker Compose version
docker-compose --version

# Display Docker Compose info
docker-compose version

# Display a message indicating successful installation
echo "Docker has been successfully installed and configured. Please log out and log back in to apply group changes."

