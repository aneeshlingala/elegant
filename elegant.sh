#!/usr/bin/env bash

version=4
newver=$(curl -s https://raw.githubusercontent.com/aneeshlingala/elegant/main/version)

if [ "$EUID" -eq 0 ]; then
    echo "Error: do not run elegant as root."
    exit
fi

if [ -d "/usr/share/elegant" ]
then
    echo "/usr/share/elegant exists... continuing."
else
    echo "Error: /usr/share/elegant not found. Please reinstall Elegant!"
    exit
fi

  if [ $newver -gt $version ]; then
    echo "Installing an update..."
    sudo rm -rf /usr/bin/elegant
    cd /usr/bin
    sudo wget https://raw.githubusercontent.com/aneeshlingala/elegant/main/elegant.sh
    sudo mv elegant.sh elegant
    sudo chmod +x elegant
    cd ~
    exit
fi

if [ "$1" == "" ]; then 
    echo ""
    echo "Error: No option specified. View available options by running elegant --help."
fi

if [ "$1" == "--help" ]; then 
    echo ""
    echo "Options:"
    echo ""
    echo "--install : install a package"
    echo "--remove : remove a package"
    echo "--help : see available options"
    echo "--reinstall : reinstall a package"
    echo "--info : view information about a package"
    echo ""
    echo "That's it!"
fi

if [ "$1" == "--install" ]; then
     if [ -z "$2" ]; then
        echo "Error: No package specified."
        exit
fi
    if grep "$2" /usr/share/elegant/installed > /dev/null
    then
        echo "Error: $2 already installed... use --reinstall to reinstall."
        exit
    else
        echo "Package $2 not installed, continuing..."
fi

    echo "Installing $2..."
    curl "https://raw.githubusercontent.com/aneeshlingala/elegant-pkgs/main/$2/pkginstall" | bash
    echo "$2" | sudo tee -a /usr/share/elegant/installed
fi

if [ "$1" == "--remove" ]; then
     if [ -z "$2" ]; then
        echo "Error: No package specified."
        exit
fi
    if grep "$2" /usr/share/elegant/installed > /dev/null
    then
        echo "$2 is installed... continuing."

    else
        echo "Error: $2 is not installed."
        exit
fi

    echo "Removing $2..."
    curl "https://raw.githubusercontent.com/aneeshlingala/elegant-pkgs/main/$2/pkgremove" | bash
    cat /usr/share/elegant/installed | sed "/$2/d"
fi

if [ "$1" == "--reinstall" ]; then
     if [ -z "$2" ]; then
        echo "Error: no package specified."
        exit
fi
    if grep "$2" /usr/share/elegant/installed > /dev/null
    then
        echo "$2 is installed... continuing."
        
    else
        echo "Error: package $2 not installed."
        exit
fi

    echo "Reinstalling $2..."
    curl "https://raw.githubusercontent.com/aneeshlingala/elegant-pkgs/main/$2/pkgremove" | bash
    curl "https://raw.githubusercontent.com/aneeshlingala/elegant-pkgs/main/$2/pkginstall" | bash
    
    fi

if [ "$1" == "--info" ]; then 
    if [ -z "$2" ]; then
        echo "Error: no package specified."
fi
    cd ~
    wget "https://raw.githubusercontent.com/aneeshlingala/elegant-pkgs/main/$2/pkginfo" >/dev/null 2>&1 
    cat pkginfo
    rm -rf pkginfo
fi
