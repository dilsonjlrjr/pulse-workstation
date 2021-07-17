#!/bin/bash

COMMON_TITLE_PROGRAM="Pulse 2021 - Script de Instação de Workstation"
COMMON_TEMP_DIR="./temp"
COMMON_LOG_FILE="${COMMON_TEMP_DIR}/pulse.log"


function infoMessage() {
    clear
    dialog  --backtitle     "${COMMON_TITLE_PROGRAM}"  \
            --sleep         1                   \
            --title         "$1"                \
            --infobox       "$2"                \
            5 100
}

#Criando diretório temporário
rm -Rf ${COMMON_TEMP_DIR}
infoMessage "Temp Dir" "Criando diretório para temporários."
if ! mkdir ${COMMON_TEMP_DIR}
then
    infoMessage "Error" "Ocorreu um erro criar o diretório temporário.\nVerifique as permissões do usuário."
    exit 1
fi
infoMessage "Temp Dir" "Diretório temporário criado com sucesso."


#Preparando o ambiente atualizando o apt-get
infoMessage "Buscando atualização" "Preparando o repositório do apt."

if ! sudo sudo apt update -y >> ${COMMON_LOG_FILE}
then
    infoMessage "Error" "Ocorreu um erro ao atualizar o repositório do apt-get."
    exit 1
fi
infoMessage "Buscando atualização" "Atualizando todo o sistema."

if ! sudo sudo apt upgrade -y >> ${COMMON_LOG_FILE}
then
    infoMessage "Error" "Ocorreu um erro ao atualizar o sistema operacional. Avise a Engenharia."
    exit 1
fi
infoMessage "Buscando atualização" "Atualização concluída com sucesso!"


#instalando o wget
infoMessage "wget" "Preparando a instalação do wget."
if ! sudo sudo apt install wget -y >> ${COMMON_LOG_FILE}
then
    infoMessage "Error" "Ocorreu um erro ao instalar o wget."
    exit 1
fi
infoMessage "wget" "wget instalado com sucesso."


#instalando o dependencias genericas
infoMessage "Deps" "Preparando a instalação de dependencias genéricas."
if ! sudo sudo apt install apt-transport-https curl -y >> ${COMMON_LOG_FILE}
then
    infoMessage "Error" "Ocorreu um erro ao instalar as dependencias genéricas."
    exit 1
fi
infoMessage "Deps" "Dependencias genéricas instalado com sucesso."
