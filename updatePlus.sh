#!/bin/bash

flatpak uninstall --unused

apt-get update
apt-get install upgrade

reboot
