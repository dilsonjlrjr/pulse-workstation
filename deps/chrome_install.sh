#!/bin/bash

CHROME_URL_DOWNLOAD="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
CHROME_FILENAME="${COMMON_TEMP_DIR}/chrome_stable.deb"

function chrome_install_dep() {
    wget ${CHROME_URL_DOWNLOAD} -O ${CHROME_FILENAME}
}

function chrome_install_program() {
    sudo apt install ${CHROME_FILENAME} -y >> ${COMMON_LOG_FILE}
}

infoMessage "Google Chrome" "Preparando a instalação das dependências."
if ! chrome_install_dep
then
    infoMessage "Error" "Ocorreu um erro ao instalar as dependências do Google Chrome."
    exit 1
fi
infoMessage "Google Chrome" "Dependencias do Google Chrome instalado com sucesso."

infoMessage "Google Chrome" "Preparando a instalação do Google Chrome."
if ! chrome_install_program
then
    infoMessage "Error" "Ocorreu um erro ao instalar o Goole Chrome."
    exit 1
fi
infoMessage "Google Chrome" "Google Chrome instalado com sucesso."
