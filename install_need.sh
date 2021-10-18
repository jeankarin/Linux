#!/bin/bash

### Habilitamos la red.
systemctl enable NetworkManager

### Instalamos los paquetes que más me gustan.
pacman -S \
    lightdm \
	lightdm-gtk-greeter \
	lightdm-gtk-greeter-settings \
	networkmanager \
	network-manager-applet \
	xorg \
	alacritty \
	feh \
	dmenu \
	pcmanfm \
	firefox \
	qtile \
	gnucash \
	libdbi-drivers \
	kmymoney \
	python-pip \
	sudo