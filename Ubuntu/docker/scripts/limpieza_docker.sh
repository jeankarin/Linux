# Eliminar contenedores intermedios
docker container prune -f

# Eliminar imágenes colgantes (intermedias)
docker image prune -f

# Si deseas eliminar todas las imágenes no referenciadas
docker image prune -a -f

# Eliminar todos los volúmenes no utilizados
docker volume prune -f

# Para una limpieza más exhaustiva (contenedores, imágenes, volúmenes y redes no utilizados)
docker system prune -a -f