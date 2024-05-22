#!/bin/bash
set -e

# Iniciar dbus
service dbus start

# Iniciar avahi-daemon manualmente si no está disponible como servicio
if command -v avahi-daemon >/dev/null 2>&1; then
    avahi-daemon -D
else
    echo "avahi-daemon no está instalado o no se puede ejecutar"
fi

# Iniciar CUPS
exec cupsd -f