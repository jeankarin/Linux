#!/bin/bash

# Comprovamos que se ejecute como root
if [[ $EUID -ne 0 ]];then
	echo "Debes ejecutar el script como root"
	exit 1
fi

FILE=/etc/apt/apt.conf.d/20auto-upgrades

if [[ -f $FILE ]];then
	echo "Fichero existe"
	sed -i 's/"1"/"0"/g' $FILE
fi
