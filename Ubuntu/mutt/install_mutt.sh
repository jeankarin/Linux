#!/bin/bash

# Comprovamos que se ejecuta como root
if [[ $EUID -ne 0 ]];then
	echo "Este script debe ser ejecutado por el usuario root" 1>&2
	exit 1
fi

# Comprobamos si hemos pasado un parámetro como mínimo, sino salimos
if [ $# -eq 0 ]; then
    echo "Usage: $0 <user>"
    exit 1
else
    # Comprobamos si existe el usuario en /etc/passwd
    USER=`cat /etc/passwd | cut -d":" -f 1 | grep $1`
    if [[ $1 == ${USER} ]];then
        #Instalamos mutt
        sudo apt install mutt -y

        #Creamos las carpetas
        mkdir -p /home/$1/.mutt/cache/headers

        #Si se crea la carpeta cache creamos la carpeta bodies
        if [[ -d /home/$1/.mutt/cache/ ]];then
            mkdir /home/$1/.mutt/cache/bodies
        fi

        #Si se crea la carpeta .mutt creamos el fichero certificates
        #y copiamos el fichero de configuración
        if [[ -d /home/$1/.mutt/ ]];then
            touch /home/$1/.mutt/certificates
            cp muttrc /home/$1/.mutt
        fi
    else
        # Informamos que no hemos encontrado ningún usuario en /etc/passwd
        echo "Usuario no encontrado"
        exit 1
    fi
fi