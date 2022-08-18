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
        sudo su -c "cat src/debian-sources.list >> /etc/apt/sources.list"
    elif grep 'Ubuntu' -q /etc/issue; then 
        sudo add-apt-repository multiverse
    else
        exit
    fi

    # Install requirements for 'steamcmd'
    sudo apt install -y software-properties-common
    sudo dpkg --add-architecture i386
    sudo apt -y update && sudo apt install -y steamcmd


    # Install Battalion: Legacy from 'steamcmd'
    cd ~
    mkdir BattalionServerData && cd BattalionServerData/
    steamcmd +force_install_dir $(pwd) +login anonymous +app_update 805140 +quit

    # Copy 'steamclient.so' to the correct locations
    mkdir -p ~/.steam/sdk64
    cp linux64/steamclient.so ~/.steam/sdk64/steamclient.so
    cp linux64/steamclient.so Battalion/Binaries/Linux/

    cd ../BLD
    echo ""
    echo "[*] Battalion Dedicated Server is installed!"
    echo "[*] You can launch the server using './launch.sh'"
}

function main {
    clear
    banner
    install
}

main
