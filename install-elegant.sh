#!/usr/bin/env bash

if [ "$EUID" -eq 0 ]; then
    echo "Error: do not run Elegant Installer as root."
    exit
fi

echo "Installing Elegant..."
sudo mkdir /usr/share/elegant
sudo touch /usr/share/elegant/installed
mkdir ~/.local/share/elegant
cd /usr/bin
sudo wget https://raw.githubusercontent.com/aneeshlingala/elegant/main/elegant.sh
sudo mv elegant.sh elegant
sudo chmod +x elegant
echo "Finished installing Elegant!"
exit
