#!/bin/bash

DISCORD_PROGRAM_TITLE="Flameshot"
DISCORD_PROGRAM_NAME="Flameshot"

function discord_install_dep() {
    echo "No deps!" >> ${COMMON_LOG_FILE}
}

function discord_install_program() {
    sudo sudo snap install discord >> ${COMMON_LOG_FILE}
}

infoMessage "${DISCORD_PROGRAM_TITLE}" "Preparando a instalação das dependências."
if ! discord_install_dep
then
    infoMessage "Error" "Ocorreu um erro ao instalar as dependências do ${DISCORD_PROGRAM_NAME}."
    exit 1
fi
infoMessage "${DISCORD_PROGRAM_TITLE}" "Dependencias do ${DISCORD_PROGRAM_NAME} instalado com sucesso."

infoMessage "${DISCORD_PROGRAM_TITLE}" "Preparando a instalação do ${DISCORD_PROGRAM_NAME}."
if ! discord_install_program
then
    infoMessage "Error" "Ocorreu um erro ao instalar o ${DISCORD_PROGRAM_NAME}."
    exit 1
fi
infoMessage "${DISCORD_PROGRAM_TITLE}" "${DISCORD_PROGRAM_NAME} instalado com sucesso."
