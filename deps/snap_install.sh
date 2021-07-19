#!/bin/bash

function snap_install_dep() {
    echo "Removendo histórico do snap..." >> ${COMMON_LOG_FILE}
    sudo rm /etc/apt/preferences.d/nosnap.pref
    sudo apt update >> ${COMMON_LOG_FILE}
}

function snap_install_program() {
    sudo apt install snapd >> ${COMMON_LOG_FILE}
}

infoMessage "Snap" "Preparando a instalação das dependências."
if ! snap_install_dep
then
    infoMessage "Error" "Ocorreu um erro ao instalar as dependências do Snap."
    exit 1
fi
infoMessage "Snap" "Dependencias do Snap instalado com sucesso."

infoMessage "Snap" "Preparando a instalação do Snap."
if ! snap_install_program
then
    infoMessage "Error" "Ocorreu um erro ao instalar o Snap."
    exit 1
fi
infoMessage "Snap" "Snap instalado com sucesso."
