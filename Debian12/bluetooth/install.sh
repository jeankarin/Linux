#!/bin/bash

# Comprovamos que se ejecute como root
if [[ $EUID -ne 0 ]];then
	echo "Debes ejecutar el script como root"
	exit 1
fi

# Instalamos los paquetes necesarios para el bluetooth
apt install bluetooth blueman pulseaudio pulseaudio-module-bluetooth pavucontrol bluez-firmware

# Comprobamos el status
systemctl status bluetooth
systemctl restart bluetooth

""" Me han funcionado los auriculares después de reiniciar el PC. Supongo que hay que reiniciar el módulo de sonido """