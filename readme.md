# Elegant Package Manager
## What is this?
Elegant Package Manager is a package manager written in bash, only focusing on easily installing your favorite Linux desktop customizations.
> Note: This project is still in beta.

## Installation
Elegant package manager requires curl, wget, bash, and binutils/busybox to be installed.
### Using the install script
> The install script needs to be run as root.

To install with the script, you have to run:

curl https://raw.githubusercontent.com/aneeshlingala/elegant/main/install-elegant.sh | bash

### Installing manually
> These commands need to be run as root.

Go to /usr/bin using: cd /usr/bin

Then, download the Elegant package manager: wget https://raw.githubusercontent.com/aneeshlingala/elegant/main/elegant.sh

After that, you need to rename the script: mv elegant.sh elegant

Now, we need to make it executable: chmod +x elegant

## Package Repository
The Elegant package repository is located at: https://github.com/aneeshlingala/elegant-pkgs



