#!/bin/bash

apt-get updates
apt-get install upgrades


flatpak install flathub org.mozilla.firefox

gksudo firefox -install-global-extension https://addons.mozilla.org/firefox/downloads/file/3933192/ublock_origin-1.42.4-an+fx.xpi
#https://askubuntu.com/questions/73474/how-to-install-firefox-addon-from-command-line-in-scripts
