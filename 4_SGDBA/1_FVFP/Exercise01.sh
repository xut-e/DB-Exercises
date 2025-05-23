#!/bin/bash
# Primero creo el directorio y le doy el propietario correspondiente (he tenido que hacer esto porque al usar Kali Linux no existia dicho fichero).
sudo mkdir -p /var/log/mysql
sudo chown mysql:mysql /var/log/mysql

# Editamos el archivo de configuración (también se puede encontrar como /eetc/mysql/my.cnf).
echo "[mysqld]
log_error = /var/log/mysql/errors_mysql.log" > /etc/mysql/mysql.conf.d/mysqld.cnf 

#Para el log de consultasa agragamos las siguientes lineas
echo "general_log = 1
general_log_file = /var/log/mysql/queries.log" >> /etc/mysql/mysql.conf.d/mysqld.cnf

# Para el log de consultas lentas agragamos las siguientes lineas al archivo
echo "slow_query_log = 1
slow_query_log_file = /var/log/mysql/slow-queries.log
long_query_time = 2" >> /etc/mysql/mysql.conf.d/mysqld.cnf

#La configuración completa tiene el siguiente aspecto:

if false; then

    Esto es un comentario porque nunca se va a ejecutar:

    [mysqld]
    # Log de errores
    log_error = /var/log/mysql/errors_mysql.log

    # Log general de consultas
    general_log = 1
    general_log_file = /var/log/mysql/queries.log

    # Log de consultas lentas
    slow_query_log = 1
    slow_query_log_file = /var/log/mysql/slow-queries.log
    long_query_time = 2 # Duración de la query para ser considerada lenta


fi

# Reiniciamos el servicio para que se carguen los daemons.
sudo systemctl restart mysql

# Comprobamos que se han escrito correctamente los logs (imprescindible que el usuario tenga permisos de lectura del directorio).
sudo ls -l /var/log/mysql/
