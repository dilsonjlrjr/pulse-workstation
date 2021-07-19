#!/bin/bash

QT_PROGRAM_TITLE="QT"
QT_PROGRAM_NAME="QT"

QT_VERSION_MAJOR="5.9"
QT_VERSION="5.9.6"

QT_RESOURCE="./resource"
QT_RESOURCE_MAKE="${QT_RESOURCE}/make"
QT_RESOURCE_NONINTERACTIVE="${QT_RESOURCE}/qt-noninteractive.qs"


QT_URL_DOWNLOAD="https://download.qt.io/archive/qt/${QT_VERSION_MAJOR}/${QT_VERSION}/qt-opensource-linux-x64-${QT_VERSION}.run"
QT_FILENAME="${COMMON_TEMP_DIR}/qt_stable.run"

QT_FOLDER_INSTALL="/home/$(whoami)/Qt${QT_VERSION}"

QT_SQL_DRIVERS="${QT_FOLDER_INSTALL}/${QT_VERSION}/Src/qtbase/src/plugins/sqldrivers"
QT_QMAKE="${QT_FOLDER_INSTALL}/${QT_VERSION}/gcc_64/bin/qmake"

QT_HOME_SCRIPT="$(pwd)"


function qt_install_dep() {
    sudo apt install -y build-essential             tzdata                                              \
                        unixodbc                    unixodbc-dev                                        \
                        freetds-dev                 freetds-bin         freetds-common                  \
                        tdsodbc                                                                         \
                        libx11-xcb-dev              libdw1 libdw-dev    libgl-dev                       \
                        libgl1-mesa-dev             qtdeclarative5-dev  qml-module-qtquick-controls2    \
                        software-properties-common                                                      \
                        icecc                       icecc-monitor                                       \
                        >> ${COMMON_LOG_FILE}

    echo "Configuração do IECC iniciada..." >> ${COMMON_LOG_FILE}
    sudo sed -i 's/ICECC_NETNAME=""/ICECC_NETNAME="node"/' /etc/icecc/icecc.conf

    sudo sed -i 's/ICECC_SCHEDULER_HOST=""/ICECC_SCHEDULER_HOST="icecc.mateus"/' /etc/icecc/icecc.conf
    echo "Configuração do IECC finalizado..." >> ${COMMON_LOG_FILE}

    sudo dpkg-reconfigure tdsodbc

    sudo chmod +x ${QT_RESOURCE_MAKE}

    sudo mv /usr/bin/make /usr/bin/make.old
    
    sudo cp -f ${QT_RESOURCE_MAKE} /usr/bin
}

function qt_install_program() {
    sudo ln -sf /usr/bin/x86_64-linux-gnu-ld.gold /usr/bin/ld

    wget ${QT_URL_DOWNLOAD} -O ${QT_FILENAME} >> ${COMMON_LOG_FILE}

    sudo chmod +x ${QT_FILENAME}

    ./${QT_FILENAME} --script ${QT_RESOURCE_NONINTERACTIVE}

    rmdir make_temp; mkdir -p make_temp; cd ./make_temp

    ${QT_QMAKE} ${QT_SQL_DRIVERS}/sqldrivers.pro >> ${COMMON_LOG_FILE}

    make >> ${COMMON_LOG_FILE}

    sudo make install >> ${COMMON_LOG_FILE}
}

infoMessage "${QT_PROGRAM_TITLE}" "Preparando a instalação das dependências."
if ! qt_install_dep
then
    infoMessage "Error" "Ocorreu um erro ao instalar as dependências do ${QT_PROGRAM_NAME}."
    exit 1
fi
infoMessage "${QT_PROGRAM_TITLE}" "Dependencias do ${QT_PROGRAM_NAME} instalado com sucesso."

infoMessage "${QT_PROGRAM_TITLE}" "Preparando a instalação do ${QT_PROGRAM_NAME}."
if ! qt_install_program
then
    #infoMessage "Error" "Ocorreu um erro ao instalar o ${QT_PROGRAM_NAME}."
    exit 1
fi
infoMessage "${QT_PROGRAM_TITLE}" "${QT_PROGRAM_NAME} instalado com sucesso."
