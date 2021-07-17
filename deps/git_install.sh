#!/bin/bash

#instalador do GIT

infoMessage "Git" "Preparando a instalação do Git."
if ! sudo sudo apt install git -y >> ${COMMON_LOG_FILE}
then
    infoMessage "Error" "Ocorreu um erro ao instalar o git."
    exit 1
fi
infoMessage "Git" "Git instalado com sucesso."
