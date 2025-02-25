#!/bin/bash

# Ejecutamos script como root
if [[ $EUID -ne 0 ]]; then
	echo "Este script debe ser ejecutado por el usuario root" 1>&2
	exit 1
fi

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null

echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt-get update
sudo apt-get install apt-transport-https sublime-text sublime-merge
