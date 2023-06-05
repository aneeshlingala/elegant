#!/usr/bin/env bash
echo "Starting Elegant..."
echo ""
echo "Made by Aneesh Lingala (aneeshlingala.github.io)"
echo "Elegant is fully open-source! View the source at: https://github.com/aneeshlingala/elegant"
echo ""
echo "Defining variables..."
echo ""
echo "Running preliminary check..."

if [ -d "/usr/share/elegant" ]
then
    echo "/usr/share/elegant exists... continuing."
else
    echo "Error: /usr/share/elegant not found. Please reinstall Elegant!"
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
    echo ""
    echo "That's it!"
fi

if [ "$1" == "--install" ]; then
     if grep "$2" == ""
    then
        echo "Error: No package specified."
        exit
fi
    if grep "$2" /usr/share/elegant/installed > /dev/null
    then
        echo "Error: $2 already installed... use --reinstall to reinstall."

    else
        echo "Package $2 not installed, continuing..."
fi

    echo "Installing $2..."
    curl "https://raw.githubusercontent.com/aneeshlingala/elegant-pkgs/main/$2/pkginstall" | bash
    echo "$2" | sudo tee -a /usr/share/elegant/installed
fi

if [ "$1" == "--remove" ]; then
     if grep "$2" == ""
    then
        echo "Error: No package specified."
        exit
fi

     if grep "$2" /usr/share/elegant/installed > /dev/null
    then
        echo "$2 is installed... removing."

    else
        echo "Error: $2 is not installed."
fi

fi

    
    
