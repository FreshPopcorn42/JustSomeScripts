#!/bin/bash

#Before plugging in the SD-card:
#apt-get install exfat-fuse exfat-utils -y

OS=`lowercase \`uname\``

if ["${OS}" == "Ubunu" || "${OS}" == "Ubuntu Touch"]
then

	#PROXY:
	echo Proxys:
	HTTP:
	read http
	HTTPS:
	read https
	FTP:
	read ftp
	SFTP:
	read sftp
	'export HTTP_PROXY="[username]:[password]@[proxy-web-or-IP-address]:[$http]"' >> /etc/environment
	'export HTTPS_PROXY="[username]:[password]@[proxy-web-or-IP-address]:[$https]"' >> /etc/environment
	'export FTP_PROXY="[username]:[password]@ [proxy-web-or-IP-address]:[$ftp]"' >> /etc/environment
	'export SFTP_PROXY="[username]:[password]@ [proxy-web-or-IP-address]:[$sftp]"' >> /etc/environment
	'...' >> /etc/environment
	'export NO_PROXY="localhost,127.0.0.1,::1"Copied!' >> /etc/environment
	
	'\n' >> /etc/profile.d/proxy.sh

#ExDrive encryption
	add-apt-repository ppa:unit193/encryption
	apt update
	apt install veracrypt

	
	pr "Adding Flathub"
	sudo apt install flatpak
	sudo add-apt-repository ppa:flatpak/stable
      	sudo apt update
      	sudo apt install flatpak
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    
    	#flatpak install flathub org.gnome.GTG
	
	sudo snap remove firefox
	rm -r /snap/firefox
	
	flatpak install flathub org.videolan.VLC


elif ["${OS}" == "Ubuntu Server"]
then
	apt-get install upgrade -y

#PROXY:
	echo Proxys:
	HTTP:
	read http
	HTTPS:
	read https
	FTP:
	read ftp
	SFTP:
	read sftp
	'export HTTP_PROXY="[username]:[password]@[proxy-web-or-IP-address]:[$http]"' >> /etc/environment
	'export HTTPS_PROXY="[username]:[password]@[proxy-web-or-IP-address]:[$https]"' >> /etc/environment
	'export FTP_PROXY="[username]:[password]@ [proxy-web-or-IP-address]:[$ftp]"' >> /etc/environment
	'export SFTP_PROXY="[username]:[password]@ [proxy-web-or-IP-address]:[$sftp]"' >> /etc/environment
	'...' >> /etc/environment
	'export NO_PROXY="localhost,127.0.0.1,::1"Copied!' >> /etc/environment
	
	'\n' >> /etc/profile.d/proxy.sh
	
#ExDrive encryption
	add-apt-repository ppa:unit193/encryption
	apt update
	apt install veracrypt

#LAMP
	sudo apt-get install apache2 libapache2-mod-php7.2 php7.2 php7.2-mysql mysql-server
	sudo apt-get install phpmyadmin
	snap install nextcloud
	sudo snap refresh
	
#NAVIDROME			Make reverse proxy!!!!!!!!!!
	sudo apt update
	sudo apt upgrade
	sudo apt install vim ffmpeg
	
	#Create directory structure
	sudo install -d -o <god> -g <users> /opt/navidrome
	sudo install -d -o <god> -g <users> /var/lib/navidrome
	chown -R users /opt/navidrome
	
	touch /var/lib/navidrome/navidrome.toml
	echo "/home/god/Music" > /var/lib/navidrome/navidrome.toml
	
	#Get NAVIDROME
	wget https://github.com/navidrome/navidrome/releases/download/v0.XX.0/navidrome_0.XX.0_Linux_x86_64.tar.gz -O Navidrome.tar.gz
	sudo tar -xvzf Navidrome.tar.gz -C /opt/navidrome/
	sudo chown -R <user>:<group> /opt/navidrome
	
	#Config file:
	MusicFolder = "<library_path>" > /var/lib/navidrome/navidrome.toml
	
	#Create SystemD unit:
	NAVIDROMeSystemD = """[Unit]
Description=Navidrome Music Server and Streamer compatible with Subsonic/Airsonic
After=remote-fs.target network.target
AssertPathExists=/var/lib/navidrome

[Install]
WantedBy=multi-user.target

[Service]
User=<user>
Group=<group>
Type=simple
ExecStart=/opt/navidrome/navidrome --configfile "/var/lib/navidrome/navidrome.toml"
WorkingDirectory=/var/lib/navidrome
TimeoutStopSec=20
KillMode=process
Restart=on-failure

# See https://www.freedesktop.org/software/systemd/man/systemd.exec.html
DevicePolicy=closed
NoNewPrivileges=yes
PrivateTmp=yes
PrivateUsers=yes
ProtectControlGroups=yes
ProtectKernelModules=yes
ProtectKernelTunables=yes
RestrictAddressFamilies=AF_UNIX AF_INET AF_INET6
RestrictNamespaces=yes
RestrictRealtime=yes
SystemCallFilter=~@clock @debug @module @mount @obsolete @reboot @setuid @swap
ReadWritePaths=/var/lib/navidrome

# You can uncomment the following line if you're not using the jukebox This
# will prevent navidrome from accessing any real (physical) devices
#PrivateDevices=yes

# You can change the following line to `strict` instead of `full` if you don't
# want navidrome to be able to write anything on your filesystem outside of
# /var/lib/navidrome.
ProtectSystem=full

# You can uncomment the following line if you don't have any media in /home/*.
# This will prevent navidrome from ever reading/writing anything there.
#ProtectHome=true

# You can customize some Navidrome config options by setting environment variables here. Ex:
#Environment=ND_BASEURL="/navidrome"
"""
	$NAVIDROMeSystemD > /etc/systemd/system/navidrome.service
	
	sudo systemctl daemon-reload
	sudo systemctl start navidrome.service
	sudo systemctl status navidrome.service
	
	#NAVIDROME on startup
	sudo systemctl enable navidrome.service
	
#Reverse proxy
	#apt-get install nginx -y
	#service nginx start
	
	###################################
	###	ADD REVERSE PROXY	###
	###################################
	
		
#Private website
	git clone https://github.com/FreshPopcorn42/JustSomeScripts/tree/main/NotScripts/Websites/JDM > /var/www/html
	
elif ["${OS}" == "Fedora"]
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
	dnf remove dolphin -y
	dnf remove elisa -y
	dnf remove ksnip -y
	
#ExtDrive encryption
	dnf install veracrypt -y
	
	# add flathub
	pr "Adding Flathub"
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo >> $logfile
	
	#Teams
	pr "Installing Teams..."
	flatpak install flathub com.microsoft.Teams
fi

if ["${OS}" != "Ubuntu Server"]
then
apt-get update -y
#apt-get updates
#apt-get install upgrades

apt install git
apt-get install macchanger

apt-get install wifite

#Install CloneZilla
#apt install clonezilla -y

#flatpak

flatpak install flathub app.organicmaps.desktop

flatpak install flathub fr.romainvigier.MetadataCleaner

flatpak install flathub com.github.tchx84.Flatseal

flatpak install flathub com.usebottles.bottles

flatpak install flathub io.exodus.Exodus --user

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
flatpak install flathub com.visualstudio.code
#flatpak install flathub io.atom.Atom
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
fi

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

		fi

else
	for user in $users
	do
		>> /home/$user/Schneewittchen/
fi

git clone https://github.com/FreshPopcorn42/JustSomeScripts/blob/main/Schneewittchen.sh >> /bin

#Uninstall example
#flatpak remove org.onlyoffice.desktopeditors

if [$OSTYPE != "Ubuntu Touch"]
then
	flatpak install flathub org.kde.elisa
	flatpak install flathub org.ksnip.ksnip
fi
reboot
