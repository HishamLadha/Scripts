#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__|
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo
echo "INSTALLING SOFTWARE"
echo

PKGS=(

    # SYSTEM --------------------------------------------------------------



    # TERMINAL UTILITIES --------------------------------------------------

    'curl'                  # Remote content retrieval
    'feh'                   # Terminal-based image viewer/manipulator
    'gnome-keyring'         # System password storage
    'htop'                  # Process viewer
    'neofetch'              # Shows system info when you launch terminal
    'openssh'               # SSH connectivity tools
    'speedtest-cli'         # Internet speed via terminal
    'tlp'                   # Advanced laptop power management
    'unrar'                 # RAR compression program
    'unzip'                 # Zip compression program
    'wget'                  # Remote content retrieval
    'zip'                   # Zip compression program

    # DISK UTILITIES ------------------------------------------------------

    'autofs'                # Auto-mounter
    'exfat-utils'           # Mount exFat drives

    # GENERAL UTILITIES ---------------------------------------------------

    'dolphin'               # KDE Filesystem browser
    'qbittorrent'           # Torrenting application
    'qt5-styleplugins'      # Style plugin for AwesomeWM theme

    # DEVELOPMENT ---------------------------------------------------------


    'electron'              # Cross-platform development using Javascript
    'git'                   # Version control system
    'gcc'                   # C/C++ compiler
    'glibc'                 # C libraries
    'python'                # Scripting language
    'jdk-openjdk'           # Java Development kit

    # WEB TOOLS -----------------------------------------------------------


    # COMMUNICATIONS ------------------------------------------------------

    'discord'               # Discord

    # MEDIA ---------------------------------------------------------------

    'mpv'                   # Simple view player

    # Gaming ---------------------------------------------------------------

    'steam-native-runtime'  # Steam

    # GRAPHICS AND DESIGN -------------------------------------------------

    'gimp'                  # GNU Image Manipulation Program
    'gwenview'              # KDE Image viewer
    'flameshot'             # Simple screenshot utility

    # PRODUCTIVITY --------------------------------------------------------

    'galculator'            # Gnome calculator

    # VIRTUALIZATION ------------------------------------------------------

    'virtualbox'            # Virtualbox
    'virtualbox-host-dkms'
    'virtualbox-guest-utils'
    'virtualbox-guest-iso'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo
