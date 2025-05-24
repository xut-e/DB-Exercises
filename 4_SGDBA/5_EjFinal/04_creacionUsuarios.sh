#!/bin/bash

#Script para crear o modificar usuarios en MySQL y otorgar privilegios

#Comprobar la cantidad de parámetros
if [ "$#" -ne 7 ]; then
    echo "[!] ERROR 01: Se deben introducir 7 parámetros." | tee -a "$1"
    exit 1
fi

#Declaración de variables
LOG_FILE=$1
USER=$2
PASSWORD=$3
HOST=$4
DATABASE=$5
TABLE=$6
PRIVILEGES=$7

#Comprobamos si existe el usuario
user_exists=$(mysql -u root -p root -Bse "SELECT 1 FROM mysql.user WHERE user='$USER' AND host='$HOST';")

#Si existe otorgamos privilegios
if [ "$user_exists" ]; then
    echo "[+] Usuario existente. Otorgando permisos..." | tee -a "$LOG_FILE"
    mysql -u root -p root -Bse "GRANT $PRIVILEGES ON $DATABASE.$TABLE TO '$USER'@'$HOST';"
#Si no existe creamos el usuario y otorgamos privilegios
else
    echo "[-] Usuario inexistente. Creando usuario y otorgando permisos..." | tee -a "$LOG_FILE"
    mysql -u root -p root -Bse "CREATE USER '$USER'@'$HOST' IDENTIFIED BY '$PASSWORD';"
    mysql -u root -p root -Bse "GRANT $PRIVILEGES ON $DATABASE.$TABLE TO '$USER'@'$HOST';"
fi

echo "[+] Permisos otorgados correctamente." | tee -a "$LOG_FILE"
exit 0