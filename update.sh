#!/bin/bash

apt-get update && apt-get install upgrade -y


flatpak update
flatpak update --appstream
flatpak uninstall --unused
