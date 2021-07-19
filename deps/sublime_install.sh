#!/bin/bash


function sublime_install_dep() {
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - >> ${COMMON_LOG_FILE}
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt update >> ${COMMON_LOG_FILE}
}

function sublime_install_program() {
    sudo apt-get -y install sublime-merge sublime-text >> ${COMMON_LOG_FILE}
}

infoMessage "Sublime" "Preparando a instalação das dependências."
if ! sublime_install_dep
then
    infoMessage "Error" "Ocorreu um erro ao instalar as dependências do Sublime e Sublime Merge."
    exit 1
fi
infoMessage "Sublime" "Dependencias do Sublime e Sublime Merge instalado com sucesso."

infoMessage "Sublime" "Preparando a instalação do Sublime e Sublime Merge."
if ! sublime_install_program
then
    infoMessage "Error" "Ocorreu um erro ao instalar o Sublime e Sublime Merge."
    exit 1
fi
infoMessage "Sublime" "Sublime e Sublime Merge instaladoscom sucesso."
