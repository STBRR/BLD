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
    echo "[*] Installing Dependencies"
    sudo apt install -y software-properties-common 2>/dev/null
    sudo dpkg --add-architecture i386 2>/dev/null
    echo "[*] Installing SteamCMD"
    sudo apt -y update 2>/dev/null && sudo apt install -y steamcmd 2>/dev/null


    # Install Battalion: Legacy from 'steamcmd'
    cd ~
    mkdir BattalionServerData && cd BattalionServerData/
    echo "[*] Installing Battalion: Legacy Dedicated Server (this might take a few mins.)"
    steamcmd +force_install_dir $(pwd) +login anonymous +app_update 805140 +quit 2>/dev/null

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
