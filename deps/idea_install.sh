#!/bin/bash

IDEA_PROGRAM_TITLE="IDEA"
IDEA_PROGRAM_NAME="IntelliJ"

PATH_IDEA="/snap/intellij-idea-community/current/bin/idea.sh"
PATH_IDEA_LINK="/usr/local/bin/idea"

function idea_install_dep() {
    echo "No deps!" >> ${COMMON_LOG_FILE}
}

function idea_install_program() {
    sudo snap install intellij-idea-community --classic >> ${COMMON_LOG_FILE}
    sudo ln -sf ${PATH_IDEA} ${PATH_IDEA_LINK}
}

infoMessage "${IDEA_PROGRAM_TITLE}" "Preparando a instalação das dependências."
if ! idea_install_dep
then
    infoMessage "Error" "Ocorreu um erro ao instalar as dependências do ${IDEA_PROGRAM_NAME}."
    exit 1
fi
infoMessage "${IDEA_PROGRAM_TITLE}" "Dependencias do ${IDEA_PROGRAM_NAME} instalado com sucesso."

infoMessage "${IDEA_PROGRAM_TITLE}" "Preparando a instalação do ${IDEA_PROGRAM_NAME}."
if ! idea_install_program
then
    infoMessage "Error" "Ocorreu um erro ao instalar o ${IDEA_PROGRAM_NAME}."
    exit 1
fi
infoMessage "${IDEA_PROGRAM_TITLE}" "${IDEA_PROGRAM_NAME} instalado com sucesso."
