# Usar Ubuntu como base
FROM ubuntu:latest

# Establecer el mantenedor
LABEL maintainer="tuemail@example.com"

# Actualizar los paquetes e instalar las dependencias necesarias
RUN apt-get update && apt-get install -y \
    cups \
    cups-client \
    cups-filters \
    cups-pdf \
    ghostscript \
    dbus \
    avahi-daemon \
    avahi-utils \
    sudo \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crear el directorio para CUPS
RUN mkdir -p /etc/cups/ssl

# Copiar el archivo de configuración de CUPS
COPY cupsd.conf /etc/cups/cupsd.conf

# Copiar el script de entrada
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Exponer el puerto de CUPS
EXPOSE 631

# Iniciar el contenedor con el script de entrada
CMD ["/entrypoint.sh"]