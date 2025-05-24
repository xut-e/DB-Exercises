#!/bin/bash

# Verificación de permisos root
if [ "$EUID" -ne 0 ]; then
    #Mensaje por consola para avisar al usuario
    echo "[!] ERROR 01: Este script requiere permisos de administrador. Ejecutar con sudo."
    #Exit 1 porque hay errores    
    exit 1
fi

# Verificación de parámetros
if [ "$#" -ne 8 ]; then
    #Mensajes por consola para que el usuario sepa cómo ejecutar el script correctamente
    echo "[!] ERROR 01: Se deben introducir 8 parámetros."
    echo "USO: ./04_creacionUsuarios.sh <log_file> <usuario> <contraseña_usuario> <host> <base_de_datos> <tabla> <privilegios> <contraseña_root>"
    #Exit 1 porque hay errores
    exit 1
fi

#Declaración de variables
LOG_FILE=$1 #Ruta del archivo log
USER=$2 #Nombre de usuario a crear o al que otorgar privilegios
PASSWORD=$3 #Contraseña de dicho usuario
HOST=$4 #Host desde el que se conectará
DATABASE=$5 #Base de datos en la que se realizarán cambios
TABLE=$6 #Tabla en la que damos permisos
PRIVILEGES=$7 #Privilegios a otorgar
ROOT_PASSWORD=$8 #Contraseña de root, para no hardcodearla porque es MUY poco seguro

# Función para ejecutar comandos MySQL (haciendolo normal no funcionaba)
execute_mysql() {
    mysql -u root -p"$ROOT_PASSWORD" -e "$1" 2>>"$LOG_FILE"
}

# Comprobar si existe el usuario
user_exists=$(execute_mysql "SELECT 1 FROM mysql.user WHERE user='$USER' AND host='$HOST';")

#Si existe otorgamos privilegios
if [ "$user_exists" ]; then
    #Mensaje para el log
    echo "[+] Usuario existente. Otorgando permisos..." | tee -a "$LOG_FILE"
    execute_mysql "GRANT $PRIVILEGES ON $DATABASE.$TABLE TO '$USER'@'$HOST';"
#Si no existe creamos el usuario y otorgamos privilegios
else
    #Mensaje para el log
    echo "[-] Usuario inexistente. Creando usuario y otorgando permisos..." | tee -a "$LOG_FILE"
    #Instrucción que crea el usuario con su contraseña
    execute_mysql "CREATE USER '$USER'@'$HOST' IDENTIFIED BY '$PASSWORD';"
    #Instrucción que otorga privilegios a un usuario sobre una tabla    
    execute_mysql "GRANT $PRIVILEGES ON $DATABASE.$TABLE TO '$USER'@'$HOST';"
fi

# Actualizar privilegios
execute_mysql "FLUSH PRIVILEGES;"

#Mensaje final de confirmación
echo "[+] Permisos otorgados correctamente." | tee -a "$LOG_FILE"
#Exit 0 porque no hay errores
exit 0