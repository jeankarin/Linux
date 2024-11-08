#!/bin/bash

# Comprovamos que se ejecute como root
if [[ $EUID -ne 0 ]];then
	echo "Debes ejecutar el script como root"
	exit 1
fi

# Install openvpn
echo "Install openvpn"
apt install openvpn network-manager-openvpn network-manager-openvpn-gnome

# Screen Irssi
echo "Install Screen e Irssi"
apt install screen irssi

# Necesario para Anki
echo "Librerías necesarias para Anki"
apt install libxcb-xinerama0 libxcb-cursor0 libnss3
"""
Hay que descargar los archivos de la web e instalar a mano
https://docs.ankiweb.net/platform/linux/installing.html
"""

