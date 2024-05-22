#!/bin/bash

### Informamos que solo funciona como root ###
if [[ $EUID -ne 0 ]]; then
    echo "Este script debe ser ejecutado por el usuario root"
    exit 1
fi

# Comprobamos si hemos pasado un parámetro como mínimo, sino salimos
if [ $# -eq 0 ]; then
    echo "Usage: $0 <user>"
    exit 1
else
    # Comprobamos si existe el usuario en /etc/passwd
    USER=`cat /etc/passwd | cut -d":" -f 1 | grep $1`
    if [[ $1 == ${USER} ]]; then
        # Actualizamos repos
        sudo apt update

        # Instalamos apps necesarias
        sudo apt install -y curl python3-pip

        # Instalamos docker
        sudo curl -sSL https://get.docker.com | sh

        # Instalamos pip para python3
        sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && sudo python3 get-pip.py

        # Instalamos docker-compose
        sudo pip3 install docker-compose

        # Añadimos el usuario pi al grupo docker
        sudo usermod -aG docker $1
    else
        # Informamos que no hemos encontrado ningún usuario en /etc/passwd
        echo "Usuario no encontrado"
    fi
fi