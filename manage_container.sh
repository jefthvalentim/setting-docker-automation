#!/bin/bash

# Função para exibir a lista de imagens

display_menu() {
    echo "Escolha uma operação:"
    echo "1. Listar containers"
    echo "2. Executar container"
    echo "3. Parar um container"
    echo "4. Eliminar um container"
    echo "5. Menu principal"
}

# Função para listar contêineres em execução
list_running_containers() {
    docker ps
}

# Função para parar um contêiner
stop_container() {
    
    docker ps
    echo -e "\n"
    read -p "Id do container: " id
    
    local container_id=$id

    if [ -z "$container_id" ]; then
        echo "Por favor, forneça o ID ou o nome do contêiner a ser parado."
    fi

    docker stop "$container_id"
    if [ $? -eq 0 ]; then
        echo "Contêiner $container_id parado com sucesso."
    else
        echo "Falha ao parar o contêiner $container_id."
        exit 1
    fi
}


# Function to delete a container
delete_container() {

    read -p "Id do container: " id
    local container_id=$id

    if [ -z "$container_id" ]; then
        echo "Por favor, forneça o ID ou o nome do container a ser excluído."
        exit 1
    fi

    docker stop "$container_id"
    docker rm "$container_id"
    if [ $? -eq 0 ]; then
        echo -e "Container $container_id excluído com sucesso.\n"
    else
        echo "Falha ao excluir o container $container_id."
        echo -e "\n"
    fi
}

# Function to run a container
run_container() {
    
    docker images
    echo -e "\n"
    read -p "Nome da imagem: " image
    local image_name=$image
    
    read -p "Nome para o container: " container
    local container_name=$container
    
    read -p "Porta: " port
    local port=$port
    
    read -p "Insira o domínio (opcional): " domain
    local domain=$domain

    docker run -d --name "$container_name" -p "$port:80" "$image_name"
    
    echo -e "Operação terminada, acesse $domain para aceder ao serviço.\n"
    
}



# Function to execute the selected option
execute_option() {
    case $1 in
        1) list_running_containers;;
        2) run_container;;
        3) stop_container;;
        4) delete_container;;
        5) ./display_menu.sh;;
        *) echo "Opção inválida";;
    esac
}

clear

# Main loop
while true; do
    display_menu

    read -p "Escolha uma opção (0-5): " option

    # Check if the entered option is a number
    if [[ $option =~ ^[0-5]$ ]]; then
        execute_option $option
    else
        echo "Entrada inválida. Por favor, escolha uma opção entre 1 & 5."
    fi

done



# Verificar se a ação é listar ou parar
action=$1

case $action in
    "list")
        list_running_containers
        ;;
    "stop")
        container_param=$2
        stop_container "$container_param"
        ;;
    *)
        echo "Uso: $0 [list|stop <container_id_or_name>]"
        exit 1
        ;;
esac

