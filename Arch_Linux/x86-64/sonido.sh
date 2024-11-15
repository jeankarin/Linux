#!/bin/bash

# Comprovamos que se ejecute como root
if [[ $EUID -ne 0 ]];then
	echo "Debes ejecutar el script como root"
	exit 1
fi

# Instalamos los paquetes necesarios para el sonido
pacman -S \
    alsa-firmware \
    sof-firmware \
    alsa-utils \
    alsa-plugins \
    alsamixer \
    --noconfirm
