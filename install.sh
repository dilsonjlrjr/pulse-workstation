#!/bin/bash

clear

source ./deps/common.sh
source ./deps/snap_install.sh

#Instaladores
source ./deps/git_install.sh
source ./deps/vscode_install.sh
source ./deps/chrome_install.sh
source ./deps/adoptjdk_install.sh
source ./deps/docker-ce_install.sh
source ./deps/dbeaver_install.sh
source ./deps/anydesk_install.sh
source ./deps/sublime_install.sh
source ./deps/idea_install.sh
source ./deps/azuredbstudio_install.sh
source ./deps/flameshot_install.sh
source ./deps/discord_install.sh
source ./deps/telegram_install.sh
source ./deps/qt_install.sh

dialog  --backtitle "Pulse 2021 - Script de Instação de Workstation"                                                    \
        --msgbox "Por favor, reinicie sua máquina para ajustes na instalação.\nBom trabalho. A Engenharia da Pulse."    6 100
