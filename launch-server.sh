#!/bin/bash

# The name of the server that'll show in the server browser.
SERVER_NAME="STBRR Battalion Server"

# Set this to blank if you do not want a password on
SERVER_PASSWORD="changeme"

cd Battalion/Battalion/Binaries/Linux
./BattalionServer-Linux-Shipping -SteamServerName=$SERVER_NAME -ServerPassword=$SERVER_PASSWORD -Queue="Wartide"
