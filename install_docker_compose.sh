#!/bin/bash

# Verifique se o Docker Compose já está instalado
if command -v docker-compose &> /dev/null; then
    echo "Docker Compose já está instalado."
    exit 0
fi

# Baixe a versão mais recente do Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Torne o arquivo baixado executável
sudo chmod +x /usr/local/bin/docker-compose

# Exiba a versão do Docker Compose instalada
docker-compose --version

echo "Docker Compose foi instalado com sucesso."

