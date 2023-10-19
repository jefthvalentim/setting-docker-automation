#!/bin/bash

chmod +x setting_docker.sh
# Function to display the menu
display_menu() {
    echo "Escolha uma operação:"
    #echo "0. Executar configurações"
    echo "1. Instalar Docker"
    echo "2. Instalar Docker Compose"
    echo "3. Instalar Portainer"
    echo "4. Instalar Nginx Proxy Manager"
    echo "5. Instalar ferramentas de monitoramento"
    echo "6. Desinstalar o Docker"
    echo "7. Gerir imagem"
    echo "8. Gerir container"
    echo "9. Sair "
}

# Function to execute the selected option
execute_option() {
    case $1 in
        0) ./setting_docker.sh;;
        1) ./install_docker.sh;;
        2) ./install_docker_compose.sh;;
        3) ./install_portainer.sh;;
        4) ./install_nginx_proxy_manager.sh;;
        5) ./install_monitoring.sh;;
        6) ./uninstall_docker.sh;;
        7) ./manage_image.sh;;
        8) ./manage_container.sh;;
        9) echo "Saindo..."; exit;;
        *) echo "Opção inválida";;
    esac
}

clear

# Main loop
while true; do
    display_menu

    read -p "Escolha uma opção (0-9): " option

    # Check if the entered option is a number
    if [[ $option =~ ^[0-9]$ ]]; then
        execute_option $option
    else
        echo "Entrada inválida. Por favor, escolha uma opção entre 1 & 7."
    fi

    # Prompt to continue or exit
    #read -p "Deseja continuar (y/n)? " yn
    #case $yn in
    #    [Nn]* ) echo "A sair..."; exit;;
    #    * ) continue;;
    #esac
done

