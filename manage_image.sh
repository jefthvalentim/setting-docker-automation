#!/bin/bash

# Função para exibir a lista de imagens

display_menu() {
    echo "Escolha uma operação:"
    echo "1. Listar imagem"
    echo "2. Baixar imagem"
    echo "3. Eliminar imagem"
    echo "4. Menu principal"
}

list_images() {
    echo -e "\n"
    docker images
    echo -e "\n"
}

download_image() {
    
    echo -e "\n"
    read -p "Nome da imagem: " id
    local image_id=$id

    if [ -z "$image_id" ]; then
        echo "Por favor, forneça o nome da imagem a ser baixada."
    fi

    docker pull "$image_id"
    if [ $? -eq 1 ]; then
        echo "Imagem $image_id baixada com sucesso."
    else
        echo "Falha ao excluir a imagem $image_id."
        echo -e "\n"
    fi
}


# Função para excluir uma imagem
delete_image() {

    read -p "Id da imagem: " id
    local image_id=$id

    if [ -z "$image_id" ]; then
        echo "Por favor, forneça o ID ou o nome da imagem a ser excluída."
        exit 1
    fi

    docker rmi "$image_id"
    if [ $? -eq 0 ]; then
        echo "Imagem $image_id excluída com sucesso."
    else
        echo "Falha ao excluir a imagem $image_id."
        echo -e "\n"
    fi
}

# Function to execute the selected option
execute_option() {
    case $1 in
        1) list_images;;
        2) download_image;;
        3) delete_image;;
        4) ./display_menu.sh;;
        *) echo "Opção inválida";;
    esac
}

clear

# Main loop
while true; do
    display_menu

    read -p "Escolha uma opção (0-4): " option

    # Check if the entered option is a number
    if [[ $option =~ ^[0-4]$ ]]; then
        execute_option $option
    else
        echo "Entrada inválida. Por favor, escolha uma opção entre 1 & 4."
    fi

done

