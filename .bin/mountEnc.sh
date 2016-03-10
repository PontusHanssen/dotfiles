#!/bin/bash

if [ "$1" == "open" ]; then
	sudo losetup /dev/loop1 /home/pontus/.secret.dsk
	sudo cryptsetup luksOpen /dev/loop1 encDisk
	sudo mount /dev/mapper/encDisk /mnt/tmp
else
	sudo umount /mnt/tmp
	sudo cryptsetup luksClose encDisk
	sudo losetup -d /dev/loop1
fi
