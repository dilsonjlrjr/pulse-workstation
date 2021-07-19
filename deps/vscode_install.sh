#!/bin/bash

function vcode_install_dep() {
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > ${COMMON_TEMP_DIR}/microsoft.gpg >> ${COMMON_LOG_FILE} 
    sudo install -o root -g root -m 644 ${COMMON_TEMP_DIR}/microsoft.gpg /etc/apt/trusted.gpg.d/ >> ${COMMON_LOG_FILE}
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
}

function vcode_install_program() {
    sudo apt update >> ${COMMON_LOG_FILE}
    sudo apt install code -y >> ${COMMON_LOG_FILE}
}

infoMessage "Visual Studio Code" "Preparando a instalação das dependências."
if ! vcode_install_dep
then
    infoMessage "Error" "Ocorreu um erro ao instalar as dependências do Visual Studio Code."
    exit 1
fi
infoMessage "Visual Studio Code" "Dependencias do Visual Studio Code instalado com sucesso."

infoMessage "Visual Studio Code" "Preparando a instalação do Visual Studio Code."
if ! vcode_install_program
then
    infoMessage "Error" "Ocorreu um erro ao instalar o Visual Studio Code."
    exit 1
fi
infoMessage "Visual Studio Code" "Visual Studio Code instalado com sucesso."
