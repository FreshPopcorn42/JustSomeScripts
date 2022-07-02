#!/bin/bash

flatpak uninstall --unused
flatpak uninstall --delete-data


apt-get update && apt-get install upgrade -y

reboot
