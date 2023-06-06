#!/usr/bin/env bash

if (( $EUID != 0 )); then
    echo "Error: Please run the installer as root."
    exit
fi

echo "Installing Elegant..."
mkdir /usr/share/elegant
cd /usr/bin
wget https://raw.githubusercontent.com/aneeshlingala/elegant/main/elegant.sh
mv elegant.sh elegant
chmod +x elegant
echo "Finished installing Elegant!"
exit
