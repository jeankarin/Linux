#!/bin/bash

# Comprovamos que se ejecute como root
if [[ $EUID -ne 0 ]];then
	echo "Debes ejecutar el script como root"
	exit 1
fi

# Añadimos las llaves
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null

# Añadimos el repositorio stable
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Repositorio DEV
# echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Actualizamos los repositorios
apt update