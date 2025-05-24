#!/bin/bash

#Script para activar el log de consultas generales en MySQL

CONFIG_FILE="/etc/mysql/mysql.conf.d/mysqld.cnf"
LOG_FILE="/var/log/mysql/mysql.log"

if [ "$EUID" -ne 0 ]; then
    echo "[!] ERROR 01: Este script requiere permisos de administrador. Ejecutar con sudo."
    exit 1
fi

echo "[mysqld]
general_log = 1
general_log_file = ${LOG_FILE}" > $CONFIG_FILE

sudo systemctl restart mysql