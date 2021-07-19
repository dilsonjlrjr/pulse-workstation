#!/bin/bash

function docker_install_dep() {
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - >> ${COMMON_LOG_FILE}
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable" -y >> ${COMMON_LOG_FILE}
    sudo apt-get update >> ${COMMON_LOG_FILE}
}

function docker_install_program() {
    sudo apt-get -y install docker-ce docker-compose >> ${COMMON_LOG_FILE}
}

infoMessage "Docker ce" "Preparando a instalação das dependências."
if ! docker_install_dep
then
    infoMessage "Error" "Ocorreu um erro ao instalar as dependências do Docker."
    exit 1
fi
infoMessage "Docker ce" "Dependencias do Docker ce instalado com sucesso."

infoMessage "Docker ce" "Preparando a instalação do Docker."
if ! docker_install_program
then
    infoMessage "Error" "Ocorreu um erro ao instalar o Docker ce."
    exit 1
fi
infoMessage "Docker ce" "Docker ce instalado com sucesso."
