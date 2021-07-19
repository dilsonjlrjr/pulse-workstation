#!/bin/bash

ANYDESK_URL_DOWNLOAD="https://download.anydesk.com/linux/anydesk_6.1.1-1_amd64.deb"
ANYDESK_FILENAME="${COMMON_TEMP_DIR}/anydesk_stable.deb"

function anydesk_install_dep() {
    wget ${ANYDESK_URL_DOWNLOAD} -O ${ANYDESK_FILENAME} >> ${COMMON_LOG_FILE}
}

function anydesk_install_program() {
    sudo apt-get -y install ${ANYDESK_FILENAME} >> ${COMMON_LOG_FILE}
}

infoMessage "Anydesk" "Preparando a instalação das dependências."
if ! anydesk_install_dep
then
    infoMessage "Error" "Ocorreu um erro ao instalar as dependências do Anydesk."
    exit 1
fi
infoMessage "Anydesk" "Dependencias do Anydesk ce instalado com sucesso."

infoMessage "Anydesk" "Preparando a instalação do Anydesk."
if ! anydesk_install_program
then
    infoMessage "Error" "Ocorreu um erro ao instalar o Anydesk."
    exit 1
fi
infoMessage "Anydesk" "Anydesk instalado com sucesso."
