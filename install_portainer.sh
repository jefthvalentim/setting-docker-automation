#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if Docker is installed
if command_exists docker; then
    echo "Docker is already installed."
else
    # Install Docker using the script from the Docker website
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    rm get-docker.sh
    echo "Docker has been installed."
fi

# Check if Portainer container is running
if docker ps --format '{{.Names}}' | grep -q '^portainer$'; then
    echo "Portainer is already running."
else
    # Run Portainer container
    sudo docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
    echo "Portainer has been installed and is running."
fi

# Display Portainer access information
echo "Access Portainer at http://localhost:9000"

