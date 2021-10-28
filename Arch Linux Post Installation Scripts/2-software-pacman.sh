#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _    
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__ 
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__| 
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo
echo "INSTALLING AUR SOFTWARE"
echo


PKGS=(

    # SYSTEM UTILITIES ----------------------------------------------------

    'gtkhash'                   # Checksum verifier

    # WEB Tools -----------------------------------------------------------

    'brave-bin'                 # Chrome, but better
    'librewolf-bin'             # Firefox, but better

    # UTILITIES -----------------------------------------------------------

    'obsidian'                  # Markdown note taking app

    # DEVELOPMENT ---------------------------------------------------------
    
    'visual-studio-code-bin'    # Kickass text editor
    'kate'                      # KDE text editor
    'neovim'                    # The best text editor
    'eclipse-java'              # Java IDE

    # MEDIA ---------------------------------------------------------------

    'spotify'                   # Music player

    # COMMUNICATIONS ------------------------------------------------------

    'zoom'  # Zoom

    # THEMES --------------------------------------------------------------

    'gtk-theme-arc-git'
    'adapta-gtk-theme-git'
    'paper-icon-theme'
    'sardi-icons'
)



for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo paru -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo
