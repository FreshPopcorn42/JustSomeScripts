#!/bin/bash

apt-get updates
apt-get install upgrades

apt install flatpak

add-apt-repository ppa:flatpak/stable
apt update
apt install flatpak

apt install gnome-software-plugin-flatpak

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

reboot
