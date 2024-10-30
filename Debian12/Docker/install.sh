#!/bin/bash

# Comprovamos que se ejecute como root
if [[ $EUID -ne 0 ]];then
	echo "Debes ejecutar el script como root"
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
		# Instalamos paquetes necesarios
		apt install software-properties-common apt-transport-https ca-certificates curl gnupg lsb-release

		# Añadimos clave gpg del repositorio
		curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

		# Añadimos el repositorio de Docker
		echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

		# Actualizamos los repositorios
		apt update

		# Instalamos docker y docker-compose
		apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

		# Añadimos el usurio al grupo de Docker
		usermod -aG docker $1
	else
        # Informamos que no hemos encontrado ningún usuario en /etc/passwd
        echo "Usuario no encontrado"
    fi
fi
