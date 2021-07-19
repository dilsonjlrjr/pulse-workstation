#!/bin/bash

FLAMESHOT_PROGRAM_TITLE="Flameshot"
FLAMESHOT_PROGRAM_NAME="Flameshot"

function flameshot_install_dep() {
    echo "No deps flameshot!" >> ${COMMON_LOG_FILE}
}

function flameshot_install_program() {
    sudo snap install flameshot >> ${COMMON_LOG_FILE}
}

infoMessage "${FLAMESHOT_PROGRAM_TITLE}" "Preparando a instalação das dependências."
if ! flameshot_install_dep
then
    infoMessage "Error" "Ocorreu um erro ao instalar as dependências do ${FLAMESHOT_PROGRAM_NAME}."
    exit 1
fi
infoMessage "${FLAMESHOT_PROGRAM_TITLE}" "Dependencias do ${FLAMESHOT_PROGRAM_NAME} instalado com sucesso."

infoMessage "${FLAMESHOT_PROGRAM_TITLE}" "Preparando a instalação do ${FLAMESHOT_PROGRAM_NAME}."
if ! flameshot_install_program
then
    infoMessage "Error" "Ocorreu um erro ao instalar o ${FLAMESHOT_PROGRAM_NAME}."
    exit 1
fi
infoMessage "${FLAMESHOT_PROGRAM_TITLE}" "${FLAMESHOT_PROGRAM_NAME} instalado com sucesso."
