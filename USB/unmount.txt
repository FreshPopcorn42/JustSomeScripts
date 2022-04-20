#!/bin/bash



sudo fdisk -l

echo Which device?
read dev

umount -f /dev/$dev

#Umount as normal user (Install pumount first):)
#pumount /dev/$dev
