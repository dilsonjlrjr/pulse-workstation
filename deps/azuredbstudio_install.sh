#!/bin/bash

AZUREDB_PROGRAM_TITLE="Azure DB Studio"
AZUREDB_PROGRAM_NAME="Azure DB Studio"

AZUREDB_URL_DOWNLOAD="https://go.microsoft.com/fwlink/?linkid=2165738"
AZUREDB_FILENAME="${COMMON_TEMP_DIR}/azuredb_stable.deb"

function azuredb_install_dep() {
    wget ${AZUREDB_URL_DOWNLOAD} -O ${AZUREDB_FILENAME} >> ${COMMON_LOG_FILE}
}

function azuredb_install_program() {
    sudo apt install -y ${AZUREDB_FILENAME} >> ${COMMON_LOG_FILE}
}

infoMessage "${AZUREDB_PROGRAM_TITLE}" "Preparando a instalação das dependências."
if ! azuredb_install_dep
then
    infoMessage "Error" "Ocorreu um erro ao instalar as dependências do ${AZUREDB_PROGRAM_NAME}."
    exit 1
fi
infoMessage "${AZUREDB_PROGRAM_TITLE}" "Dependencias do ${AZUREDB_PROGRAM_NAME} instalado com sucesso."

infoMessage "${AZUREDB_PROGRAM_TITLE}" "Preparando a instalação do ${AZUREDB_PROGRAM_NAME}."
if ! azuredb_install_program
then
    infoMessage "Error" "Ocorreu um erro ao instalar o ${AZUREDB_PROGRAM_NAME}."
    exit 1
fi
infoMessage "${AZUREDB_PROGRAM_TITLE}" "${AZUREDB_PROGRAM_NAME} instalado com sucesso."
