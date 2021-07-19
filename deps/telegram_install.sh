#!/bin/bash

TELEGRAM_PROGRAM_TITLE="Telegram"
TELEGRAM_PROGRAM_NAME="Telegram"

function telegram_install_dep() {
    echo "No deps telegram!" >> ${COMMON_LOG_FILE}
}

function telegram_install_program() {
    sudo sudo snap install telegram-desktop >> ${COMMON_LOG_FILE}
}

infoMessage "${TELEGRAM_PROGRAM_TITLE}" "Preparando a instalação das dependências."
if ! telegram_install_dep
then
    infoMessage "Error" "Ocorreu um erro ao instalar as dependências do ${TELEGRAM_PROGRAM_NAME}."
    exit 1
fi
infoMessage "${TELEGRAM_PROGRAM_TITLE}" "Dependencias do ${TELEGRAM_PROGRAM_NAME} instalado com sucesso."

infoMessage "${TELEGRAM_PROGRAM_TITLE}" "Preparando a instalação do ${TELEGRAM_PROGRAM_NAME}."
if ! telegram_install_program
then
    infoMessage "Error" "Ocorreu um erro ao instalar o ${TELEGRAM_PROGRAM_NAME}."
    exit 1
fi
infoMessage "${TELEGRAM_PROGRAM_TITLE}" "${TELEGRAM_PROGRAM_NAME} instalado com sucesso."
