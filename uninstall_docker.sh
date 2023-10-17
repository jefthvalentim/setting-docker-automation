#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if Docker is installed
if command_exists docker; then
    # Remova os pacotes do Docker
    sudo apt-get purge docker-ce docker-ce-cli containerd.io

    # Remova os arquivos de configuração e imagens do Docker
    sudo rm -rf /var/lib/docker

    # Remova o grupo Docker (opcional)
    sudo groupdel docker

    # Remova o usuário do Docker (opcional)
    sudo userdel -r dockeruser

    echo "Docker desinstalado com sucesso."
else
    echo "O Docker não está instalado no seu sistema operacional."
fi
