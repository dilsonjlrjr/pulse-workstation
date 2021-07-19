#!/bin/bash

function vcode_install_dep() {
    echo "VsCode no deps!" >> ${COMMON_LOG_FILE}
}

function vcode_install_program() {
    sudo snap install code --classic >> ${COMMON_LOG_FILE}
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
