#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root"
   	exit 1
else
	#Update and Upgrade
	echo "Updating and Upgrading"
	apt-get update && sudo apt-get upgrade -y

	sudo apt-get install dialog
	cmd=(dialog --separate-output --checklist "Please Select Software you want to install:" 22 76 16)
	options=(1 "Flatpak" on  # any option can be set to default to "on"
	         2 "Build Essentials" on
	         3 "Git" on
	         4 "brave-browser" on
	         5 "librewolf" on
	         6 "virtualbox" on
	         7 "obsidian" on
	         8 "spotify" on
	         9 "steam" on
	         10 "discord" on
	         11 "mpv" on
	         12 "qbittorrent" on
	         13 "neovim" on
	         14 "VSCode" on
	         15 "zoom" on
	         16 "OpenJDK and JRE" on)
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		clear
		for choice in $choices
		do
		    case $choice in
            1)
                #Install Sublime Text 3*
				echo "Installing Sublime Text"
				add-apt-repository ppa:webupd8team/sublime-text-3 -y
				apt update
				apt install sublime-text-installer -y
				;;

			2)
			    #Install Build Essentials
				echo "Installing Build Essentials"
				apt install -y build-essential
				;;
    		3)
				#Install git
				echo "Installing Git, please congiure git later..."
				apt install git -y
				;;

			4)
				#Install Brave browser
				echo "Installing Brave Browser"
                apt install apt-transport-https curl
                curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
                echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
                apt update
                apt install brave-browser
				;;

			5)
                #Install Librewolf browser
				echo "Librewolf"
				flatpak install flathub io.gitlab.librewolf-community
				;;

			6)
				#Install Virtualbox
				echo "Installing Virtualbox"
				apt install virtualbox virtualbox-guest-iso virtualbox-dkms virtualbox-ext-pack -y
				sudo usermod -aG vboxusers $USER
				;;
			7)
				#Install Obsidian
				echo "Installing Obsidian"
				flatpak install flathub md.obsidian.Obsidian
				;;
			8)
				#Install spotify
				echo "Installing Spotify"
				flatpak install flathub com.spotify.Client
				;;
			9)
				#Install steam
				echo "Installing Steam"
				flatpak install flathub com.valvesoftware.Steam
				;;
			10)
				#Install Discord
				echo "Installing Discord"
				flatpak install flathub com.discordapp.Discord
				;;
			11)
				#Install mpv
				echo "Installing mpv"
                apt install mpv -y
				;;
			12)
                #Install Qbittorrent
				echo "qbittorrent"
				apt install qbittorrent -y
				;;
			13)
				#Install neovim
				echo "Installing neovim"
				apt install neovim
				;;
			14)

				#Install Visual Studio Code
				echo "Installing Visual Studio Code"
				flatpak install flathub com.visualstudio.code
				;;
			15)

				#Install Zoom
				echo "Installing Zoom"
				flatpak install flathub us.zoom.Zoom
				;;
			16)
				#Install OpenJDK
				echo "Installing OpenJDK"
				apt install openjdk-17-jdk
				apt install openjdk-17-jre
				;;

	    esac
	done
fi
