#!/bin/bash

# Este script toma una captura de pantalla del espacio de trabajo actual usando scrot, luego usará la utilidad de conversión de imagemagick para desenfocar la captura de pantalla.

# Despuós superpondrá la imagen borrosa con la nuestra y, finalmente, utilizando i3lock, bloqueará la pantalla con las imágenes combinadas.

# Despuós de 5 minutos de estar bloqueado, se apagará el monitor.

# La próxima vez que se desbloquee la pantalla, se limpia y eliminan todos los archivos /tmp/*screen*.png gracias a la función revert.

# Función para borrar los ficheros temporales
revert() {
	rm /tmp/*screen*.png
	xset dpms 0 0 0
}

trap revert HUP INT TERM
xset +dpms 0 0 5
scrot -d 1 /tmp/locking_screen.png
convert -blur 0x8 /tmp/locking_screen.png /tmp/screen_blur.png
convert -composite /tmp/screen_blur.png /tmp/gmo9H9U.png -gravity South -geometry -20x1200 /tmp/screen.png
i3lock -i /tmp/screen.png
revert
