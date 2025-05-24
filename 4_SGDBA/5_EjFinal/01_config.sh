#!/bin/bash

#Script para activar el log de consultas generales en MySQL

#Declaración de variables
CONFIG_FILE="/etc/mysql/mysql.conf.d/mysqld.cnf" #Variable con el nombre del archivo de configuración
LOG_FILE="/var/log/mysql/mysql.log" #Variable con el nombre del archivo que registrará los logs

#Comprobamos si el usuario que ejecutó el script es root
if [ "$EUID" -ne 0 ]; then
    #Si no lo es lanzamos un mensaje de error y salimos de la ejecución del programa
    echo "[!] ERROR 01: Este script requiere permisos de administrador. Ejecutar con sudo."
    exit 1
fi

#Si no detectamos que no es root (o sea que sí lo es), modificamos el contenido del archivo de configuración para activar el general log y decirle dónde guardarlo
echo "[mysqld]
general_log = 1
general_log_file = ${LOG_FILE}" > $CONFIG_FILE

#Reiniciamos el servicio mysql para que funcione
sudo systemctl restart mysql