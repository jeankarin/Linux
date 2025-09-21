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

        # Quitamos paquetes conflictivos
         for pkg in docker.io docker-doc docker-compose docker-compose-v2 \
          podman-docker containerd runc; do sudo apt-get remove $pkg; done

        # Añadimos GPG Key y apps
        sudo apt install -y curl ca-certificates && \
        sudo install -m 0755 -d /etc/apt/keyrings && \
        sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && \
        sudo chmod a+r /etc/apt/keyrings/docker.asc

        # Añadimos repositorio al apt source
        echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

        # Instalamos la ultima versión
        sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

        # Añadimos el usuario indicado al grupo docker
        sudo usermod -aG docker $1

        # Arrancamos servicio
        SERVICE="docker"
        STATUS=$(systemctl is-active $SERVICE)
        ENABLED=$(systemctl is-enabled $SERVICE)
        if [[ "$STATUS" == "active" && "$ENABLED" == "enabled" ]]; then
        	echo "Docker esta actgivo y habilitado"
        else
        	if [[ "$STATUS" != "active" ]]; then
        		echo "$SERVICE no está activo. Iniciando..."
        		systemctl start $SERVICE
            fi

            if [[ "$ENABLED" != "enabled" ]]; then
            	echo "$SERVICE no está habilitado. Habilitando..."
            	systemctl enable $SERVICE
            fi
        fi
    else
        # Informamos que no hemos encontrado ningún usuario en /etc/passwd
        echo "Usuario no encontrado"
    fi
fi