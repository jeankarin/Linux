#!/bin/bash

### Instalamos los paquetes que más me gustan.
pacman -S \
    minikube \
	conntrack-tools \
	kubectl \
	docker

### Habilitamos docker
systemctl enable docker
systemctl start docker

### Arrancamos minikube con docker
sudo minikube start --driver=none
sudo minikube status