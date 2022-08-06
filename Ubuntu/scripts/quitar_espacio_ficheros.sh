#!/bin/bash

if [ -z $1 ]; then
	echo "Falta pasar parámetro"
else
	sed -i -e 's/\r$//' $1
fi
