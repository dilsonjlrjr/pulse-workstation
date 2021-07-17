#!/bin/bash

ADOPTJDK_JAVA_VERSION=8

function adoptjdk_install_dep() {
    wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
    sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
}

function adoptjdk_install_program() {
    sudo apt update >> ${COMMON_LOG_FILE}
    sudo apt install adoptopenjdk-${ADOPTJDK_JAVA_VERSION}-hotspot -y >> ${COMMON_LOG_FILE}

    sudo sudo update-alternatives --set java /usr/lib/jvm/adoptopenjdk-${ADOPTJDK_JAVA_VERSION}-hotspot-amd64/bin/java
}

infoMessage "AdoptJDK ${ADOPTJDK_JAVA_VERSION}" "Preparando a instalação do AdoptJDK ${ADOPTJDK_JAVA_VERSION}."
if ! adoptjdk_install_dep
then
    infoMessage "Error" "Ocorreu um erro ao instalar as dependências do AdoptJDK ${ADOPTJDK_JAVA_VERSION}."
    exit 1
fi
infoMessage "AdoptJDK ${ADOPTJDK_JAVA_VERSION}" "Dependencias do AdoptJDK ${ADOPTJDK_JAVA_VERSION} instalado com sucesso."

infoMessage "AdoptJDK ${ADOPTJDK_JAVA_VERSION}" "Preparando a instalação do AdoptJDK ${ADOPTJDK_JAVA_VERSION}."
if ! adoptjdk_install_program
then
    infoMessage "Error" "Ocorreu um erro ao instalar o AdoptJDK ${ADOPTJDK_JAVA_VERSION}."
    exit 1
fi
infoMessage "AdoptJDK ${ADOPTJDK_JAVA_VERSION}" "AdoptJDK ${ADOPTJDK_JAVA_VERSION} instalado com sucesso."
