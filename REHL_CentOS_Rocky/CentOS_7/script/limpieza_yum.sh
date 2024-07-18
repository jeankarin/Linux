#!/bin/bash

### Informamos que solo funciona como root ###
if [[ $EUID -ne 0 ]]; then
	echo "Este script debe ser ejecutado por el usuario root"
	exit 1
fi

yum clean all
yum makecache fast
yum update
