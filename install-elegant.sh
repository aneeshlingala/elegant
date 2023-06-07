#!/usr/bin/env bash

if [ "$(id -u)" -ne 0 ]; then
        echo "Error: this script needs to be run as root." >&2
        exit
fi

echo "Installing Elegant..."
mkdir /usr/share/elegant
touch /usr/share/elegant/installed
cd /usr/bin
wget https://raw.githubusercontent.com/aneeshlingala/elegant/main/elegant.sh
mv elegant.sh elegant
chmod +x elegant
echo "Finished installing Elegant!"
exit
