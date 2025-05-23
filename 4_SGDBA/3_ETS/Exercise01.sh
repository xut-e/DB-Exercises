#!/bin/bash
#0. Comprobamos si recibe los parámetros
if [ $# -ne 5 ]; then
    echo "!Error 01: Número de parámetros incorrecto."
    echo "- Uso: ./backupDB.sh <usuario> <contraseña> <host> <base_de_datos> <destino>"
    exit 1
fi

#1. Preparamos variables
user=$1
password=$2
host=$3
database=$4
destination=$5
date_var=$(date + "%Y%m%d_%H%M%S")
file_name="${database}_${date_var}.sql.gz"

#2. Comprobamos si existe el directorio destino
if [ ! -d "$destination" ]; then
    echo "!Error 02: El directorio de destino '$destination' no existe."
    exit 2
fi

#3. Hacemos la copia de seguridad y comprimimos
echo "+ Haciendo la copia de seguridad de la base de datos ${database}..."
mysqldump -u "$user" -p "$password" -h "$host" "$database" | gzip > "/tmp/${file_name}"

#4. Movemos el fichero al destino
mv "/tmp/${file_name}" "${destination}/${file_name}"

if [ $? -eq 0 ]; then
    echo "+ Copia de seguridad realizada con éxito en: ${destination}/${file_name}"
else
    echo "!Error 03: No se ha podido realizar la copia de seguridad."
    exit 3
fi