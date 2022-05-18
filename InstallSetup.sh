#!/bin/bash

#Before plugging in the SD-card:
#apt-get install exfat-fuse exfat-utils

apt-get update -y
apt-get updates
apt-get install upgrades

	#How to remove stuff
#apt-get remove --purge libreoffice*
#apt-get clean
#apt-get autoremove

apt-get install macchanger

apt-get install wifite

#Install CloneZilla
#apt install clonezilla -y

#flatpak

flatpak install flathub org.videolan.VLC

flatpak install flathub fr.romainvigier.MetadataCleaner

flatpak install flathub com.github.tchx84.Flatseal

flatpak install flathub com.usebottles.bottles

flatpak install flathub org.gnome.GTG

	#Music
#flatpak install flathub com.spotify.Client

	#Comunication
flatpak install flathub org.signal.Signal
#Mastodor TWITTER REPLACEMENT
flatpak install flathub social.whalebird.WhalebirdDesktop

	#Office suite
#flatpak install flathub org.onlyoffice.desktopeditors
flatpak install flathub org.libreoffice.LibreOffice


	#Software development
#flatpak install flathub com.visualstudio.code
flatpak install flathub io.atom.Atom
#https://atom.io/packages/import
#https://atom.io/packages/git-clone

	#Browser
flatpak install flathub org.mozilla.firefox
	#Browser-extension:

EXTENSIONSDIR="/usr/lib/firefox-addons/extensions"
TMP="/tmp/firefox-extension-install-temp"

[ x"$1" == "x" ] || [ ! -f $1 ] && echo "Specify valid .xpi file as argument." && exit 1

sudo rm -rf $TMP 2>/dev/null
mkdir -p "$TMP"
trap "sudo rm -rf $TMP 2>/dev/null" 1 2 3 15
unzip "$1" -d "$TMP" &> /dev/null

for token in `cat $TMP/install.rdf` ; do
	echo "$token" | grep "urn:mozilla:install-manifest" &> /dev/null && after_manifest_declaration=true
	if $after_manifest_declaration; then
		if echo "$token" | grep 'em:id=\"' ; then
			extension_id=`echo "$token" | sed 's/.*em:id="\(.*\)".*/\1/'`
		elif echo "$token" | grep '<em:id>' ; then
			extension_id=`echo "$token" | sed 's#.*<em:id>\(.*\)</em:id>.*#\1#'`
		fi
		[ x"$extension_id" == "x" ] || break
	fi
done

rm -rf "$EXTENSIONSDIR/$extension_id" 2>/dev/null
[ x"$extension_id" == "x" ] && echo "Could not determine extension id" && exit 1;
sudo mkdir -p "$EXTENSIONSDIR"
sudo mv "$TMP" "$EXTENSIONSDIR/$extension_id" && echo "$(basename $1) installed to $EXTENSIONSDIR/$extension_id"

sudo rm -rf $TMP 2>/dev/null
#Credits to andres-erbsen:
#https://gist.github.com/andres-erbsen/1307745

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
apt-get updates
apt-get install upgrades

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