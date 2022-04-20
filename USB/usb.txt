#!/bin/bash

#Why $dvice red?

mkdir /media/usb-drive

fdisk -l

echo which device?
read device

mount /dev/$device /media/usb-drive/

cd /media/usb-drive | ls
