#!/bin/bash

#Before plugging in the SD-card:
#apt-get install exfat-fuse exfat-utils

if [$OSTYPE == "Ubunu" || $OSTYPE == "Ubuntu Touch"]
then
	sudo snap remove firefox
	rm -r /snap/firefox
	
	flatpak install flathub org.videolan.VLC
	
elif [$OSTYPE == "Fedora"]
then
	# dnf conf
	pr "Optimizing DNF configuration for speed."
	echo 'max_parallel_downloads=10' >> /etc/dnf/dnf.conf
	echo 'defaultyes=True' >> /etc/dnf/dnf.conf

	# update packages
	pr "Updating packages..."
	dnf update -y >> $logfile

	# enable third party repos
	# add rpm fusion
	pr "Adding RPM Fusion repos"
	dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm >> $logfile
 
	dnf update -y >> $logfile
	sudo dnf install plan -y
	sudo dnf install kalendar -y
	sudo dnf install kdeconnect -y
	sudo dnf install yakuake -y
	sudo dnf install krusader -y
	
	# add flathub
	pr "Adding Flathub"
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo >> $logfile
fi


apt-get update -y
#apt-get updates
#apt-get install upgrades

	#How to remove stuff
#apt-get remove --purge libreoffice*
#apt-get clean
#apt-get autoremove

apt-get install macchanger

apt-get install wifite

#Install CloneZilla
#apt install clonezilla -y

#flatpak

flatpak install flathub fr.romainvigier.MetadataCleaner

flatpak install flathub com.github.tchx84.Flatseal

flatpak install flathub com.usebottles.bottles

#flatpak install flathub org.gnome.GTG

	#Music
#flatpak install flathub com.spotify.Client

	#Comunication
flatpak install flathub org.signal.Signal
#Mastodor TWITTER REPLACEMENT
flatpak install flathub social.whalebird.WhalebirdDesktop

	#Office suite
#flatpak install flathub org.onlyoffice.desktopeditors
flatpak install flathub org.libreoffice.LibreOffice

	#Remote desktop
#flatpak install flathub org.remmina.Remmina

	#Software development
#flatpak install flathub com.visualstudio.code
flatpak install flathub io.atom.Atom
#https://atom.io/packages/import
#https://atom.io/packages/git-clone

	#Browser
flatpak install flathub org.mozilla.firefox
	#Browser-extension:
gksudo firefox -install-global-extension https://addons.mozilla.org/firefox/downloads/file/3933192/ublock_origin-1.42.4-an+fx.xpi


#Games
flatpak install flathub org.srb2.SRB2
flatpak install flathub org.gnome.TwentyFortyEight
# Games wishlist
# flatpak install flathub org.sonic3air.Sonic3AIR (needs the original to be installed, for me, not worth the diskspace)

#Wordlist (needed for my wifi-scripts, see wifi-folder in this repository)
> /usr/share/wordlists/private.txt.gz

sudo apt-get -y install dirb
sudo apt-get install -y cewl
sudo apt-get install -y netcat
sudo apt-get install -y binwalk
sudo apt-get install -y cl-base64
sudo apt-get install -y aircrack-ng
apt-get install wget
sudo apt-get install -y tcpdump
#snmpset/snmpwalk
#netdiscover
sudo apt-get install -y netdiscover
sudo apt install nmap

flatpak update

sudo apt-get update -y
#apt-get updates
#apt-get install upgrades

	#Needed for Schneewittchen
echo Schneewittchen: Ask for every user-directory? [y/n]
read yn
if [$yn == '' || $yn == y || $yn == Y]
then
	users[] = cut -d: -f1 /etc/passwd
	for user in $users
	do
		echo Make Schneewittchen directory for $user?
		read yn
		if [$yn == '' || $yn == y || $yn == Y]
		then
			>> /home/$user/Schneewittchen/
else
	for user in $users
	do
		>> /home/$USERNAME/Schneewittchen/
fi


#Uninstall example
#flatpak remove org.onlyoffice.desktopeditors

reboot
