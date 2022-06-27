#!/bin/bash

# Fichero
FICHERO='/tmp/ip_new.txt'

# Generamos fichero con la nueva IP
ip a | grep -i eth0 | grep -i 192.168.1 | cut -c 10-22 > ${FICHERO}

# Enviamos correo con la nueva IP y si falla correo con mensaje de error
if [[ -f ${FICHERO} ]];then
	mutt -s "new_ip" juanantonio@horrillo.eu < ${FICHERO}
else
	echo "No ha generado el fichero ip_new.txt" | mutt -s "new_ip_error" juanantonio@horrillo.eu
fi