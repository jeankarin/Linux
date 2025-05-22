#!/bin/bash

read -p "Instalar podman con crio (S/s)" opcion

if [[ $opcion == "S" || $opcion == "s" ]]; then
  sudo pacman -S cri-o podman --no-confirm
  sudo systemctl enable --now crio
  podman info
else
  exit 1
fi 
