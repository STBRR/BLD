#!/bin/bash

function banner {
    echo ""
    echo "⠀⠀⠙⢦⡀⠀"
    echo "⠀⠀⠀⠈⢿⣷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀"
    echo "⠀⠀⠀⠀⠀⠻⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⢸⣆⠀⠀⠀⠀⠀⠀⠀⢰"
    echo "⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣶⣄⡀⠀⠀⠀⣸⣿⣦⡀⠀⠀⠀⠀⠀⢸⡇"
    echo "⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⢀⣾⣿ "
    echo "⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣾⣿⣿⡆"
    echo "⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠉⠙⠻⢿⣿⣿⡇"
    echo "⠀⠀⠀⠐⠲⢶⣴⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿"
    echo "⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣶⣶⣶⣦⠀⠀⠀⠀⢹⣿"
    echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⡇⠙⢿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⢸⡿"
    echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡀⠀⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⣼⠇"
    echo "⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠏"
    echo "⠀⠀⠀⠀⠀⠀⠚⠛⠻⠿⢿⣿⣿⣿⣿⣿⣿⣷⣤⣤⣀⣀⣠⣤⡶⠟⠁"
    echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠙⠛⠛⠉⠉⠉"
    echo ""
    echo " Battalion: Legacy Server Installer "
    echo "        Made with <3 by STBRR       "
    echo "             [LIAM#9934]            "
    echo ""
}

function install {
    if grep 'Debian' -q /etc/issue; then
        sudo cat src/debian-sources.list >> /etc/apt/sources.list
    elif grep 'Ubuntu' -q /etc/issue; then 
        sudo add-apt-repository multiverse
    else
        exit
    fi

    sudo apt install -y software-properties-common
    sudo dpkg --add-architecture i386
    sudo apt update -y && sudo apt install -y steamcmd

    cd ~ && mkdir BattalionServerData && cd BattalionServerData
    steamcmd +force_install_dir $(pwd) +login anonymous +app_update 805140 +quit

    mkdir ~/.steam/sdk64 && cp steamclient.so ~/.steam/sdk64/
    cp steamclient.so Battalion/Binaries/Linux/

    echo "[*] Battalion Dedicated Server is installed!"
    echo "[*] You can launch the server using './launch.sh'"
}

function main {
    clear
    banner
    install
}

main
