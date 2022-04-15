#!/bin/bash

### Habilitamos la red.
systemctl enable NetworkManager
systemctl start NetworkManager

### Instalamos los paquetes que más me gustan.
pacman -S \
    lightdm \
	lightdm-gtk-greeter \
	lightdm-gtk-greeter-settings \
	networkmanager \
	network-manager-applet \
	xorg \
	#alacritty \
	kitty \
	feh \
	dmenu \
	pcmanfm \
	firefox \
	qtile \
	gnucash \
	perl-dbd-mysql \
	libdbi-drivers \
	kmymoney \
	python-pip \
	sudo \
	linux-headers \
	base-devel \
	i3lock \
	gedit \
	--noconfirm

### Arrancamos el entorno gráfico
systemctl enable lightdm
systemctl start lightdm
