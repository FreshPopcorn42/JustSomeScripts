#!/bin/bash

apt update
apt dist-upgrade

'sudo -i' >  /etc/motd/newOSversion.sh
'do-release-upgrade -d' >> /etc/motd/newOSversion.sh
"reboot" >>  /etc/motd/newOSversion.sh

"'apt-get update' >> /etc/motd/a.sh" >> /etc/motd/newOSversion.sh
"'apt-get update -y' >> /etc/motd/a.sh" >> /etc/motd/newOSversion.sh
"'apt-get install upgrade' >> /etc/motd/a.sh" >> /etc/motd/newOSversion.sh
"'rm -rf /etc/motd/newOSversion.sh' >> /etc/motd/a.sh" >> /etc/motd/a.sh" >> /etc/motd/newOSversion.sh
"'rm -- ´$0´' >> /etc/motd/a.sh" >> /etc/motd/newOSversion.sh
reboot
