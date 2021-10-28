#!/usr/bin/bash -x

# This is a script automating the ricing process of this AwesomeWM theme by ChrisTitusTech: https://github.com/ChrisTitusTech/titus-awesome

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root"
   	exit 1
else
    paru -S awesome rofi picom i3lock-fancy xclip ttf-roboto polkit-gnome materia-theme lxappearance flameshot pnmixer network-manager-applet xfce4-power-manager qt5-styleplugins papirus-icon-theme -y
    git clone https://github.com/ChrisTitusTech/titus-awesome ~/.config/awesome
    mkdir -p ~/.config/rofi
    cp $HOME/.config/awesome/theme/config.rasi ~/.config/rofi/config.rasi
    sed -i '/@import/c\@import "'$HOME'/.config/awesome/theme/sidebar.rasi"' ~/.config/rofi/config.rasi
    echo -e "\nXDG_CURRENT_DESKTOP=Unity\nQT_QPA_PLATFORMTHEME=gtk2" >> /etc/environment

    echo -e "Start lxappearance to activate the icon theme and GTK theme.\n Note: for cursor theme, edit ~/.icons/default/index.theme and ~/.config/gtk3-0/settings.ini, for the change to also show up in applications run as root, copy the 2 files over to their respective place in /root.\n Recommended Cursors - https://github.com/keeferrourke/capitaine-cursors"
fi
