#!/bin/bash

cd monitoring || exit 1

# Verifique se o docker-compose.yml existe

if [ ! -f "docker-compose.yml" ]; then
    echo "Arquivo docker-compose.yml não encontrado"
    exit 1
fi
	
# Execute docker-compose 
docker-compose up -d
