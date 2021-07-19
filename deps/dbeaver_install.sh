#!/bin/bash

DBEAVER_URL_DOWNLOAD="https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb"
DBEAVER_FILENAME="${COMMON_TEMP_DIR}/dbeaver_stable.deb"

function dbeaver_install_dep() {
    wget ${DBEAVER_URL_DOWNLOAD} -O ${DBEAVER_FILENAME} >> ${COMMON_LOG_FILE}
}

function dbeaver_install_program() {
    sudo apt-get -y install ${DBEAVER_FILENAME} >> ${COMMON_LOG_FILE}
}

infoMessage "dbeaver" "Preparando a instalação das dependências."
if ! dbeaver_install_dep
then
    infoMessage "Error" "Ocorreu um erro ao instalar as dependências do dbeaver."
    exit 1
fi
infoMessage "dbeaver" "Dependencias do dbeaver instalado com sucesso."

infoMessage "dbeaver" "Preparando a instalação do dbeaver."
if ! dbeaver_install_program
then
    infoMessage "Error" "Ocorreu um erro ao instalar o dbeaver."
    exit 1
fi
infoMessage "dbeaver" "dbeaver instalado com sucesso.
