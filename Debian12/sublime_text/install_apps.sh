#!/bin/bash

"""
Si falla por dependencias hay que tener instalador el paquete
apt-get install apt-transport-
Información de la página:
https://www.sublimetext.com/docs/linux_repositories.html
"""

# Comprovamos que se ejecute como root
if [[ $EUID -ne 0 ]];then
	echo "Debes ejecutar el script como root"
	exit 1
fi

# Función menú
menu(){
	clear
	echo
	echo "1. Instalar sublime-text"
	echo "2. Instalar sublime-merge"
	echo "3. Instalar los dos"
	echo "4. Salir"
	echo
}

# Función instalar
instalar(){
	option=$1 # Primer parámetro pasado a la función

	case $option in
		1)
			echo "Instalando sublime-text..."
			apt-get install sublime-text
			;;
		2)
			echo "Instalando sublime-merge..."
			apt-get install sublime-merge
			;;
		3)
			echo "Instalando sublime-text y sublime-merge..."
			instalar 1 # Llamamos a la opción 1 de la función
			instalar 2 # Llamamos a la opción 2 de la función
			;;
		*)
			echo "Opción no válida para instalar"
			;;
	esac
}

# mostramos el menú
menu

# Solicitamos la información al usuario
read -p "Seleccione una opción: " option

# Procesamos la opción seleccionada
case $option in
	1|2|3)
		instalar $option
		;;
	4)
		echo "Saliendo..."
		exit 0
		;;
	*)
		echo "Opción no válida. Por favor seleccione una opción del 1 al 4."
		;;
esac