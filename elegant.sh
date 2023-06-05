echo "Starting Elegant..."
echo "Defining variables..."

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
    if grep "$2" /usr/share/elegant/installed > /dev/null
    then
        echo "Error: Package already installed... use --reinstall to reinstall."

    else
        echo "Package not installed, continuing..."
fi
    echo "Installing $2..."
    curl https://raw.githubusercontent.com/aneeshlingala/elegant-pkgs/main/$2/pkginstall | bash
    echo $2 /usr/share/elegant/installed
fi