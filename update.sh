#!/bin/bash

apt-get update
apt-get install upgrade


flatpak update
flatpak update --appstream
flatpak uninstall --unused
