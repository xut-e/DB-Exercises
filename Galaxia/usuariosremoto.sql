mysql -u root -p;
root;

-- 6. Creamos un usuario remoto et que sólo tiene acceso desde una IP, en mi caso, tengo una maquina virtual con IP 192.168.1.33
CREATE USER IF NOT EXISTS 'et'@'192.168.1.33' IDENTIFIED BY 'etpassword';

-- Le damos permisos de INSERT en todas las tablas
GRANT INSERT ON galaxia.* TO 'et'@'192.168.1.33';

-- Comprobamos los permisos que tiene
SHOW GRANTS FOR 'et'@'192.168.1.33';

-- Salimos del usuario root y nos conectamos con et (al servidor)
exit;
mysql -u et -p -h 192.168.1.38;
etpassword;

-- Insertamos un nuevo tripulante para comprobar
USE galaxia;

INSERT INTO TRIPULANTES (nombre_tripulante, cargo_tripulante) VALUES ('ET', 'Piloto');
-- Si no ha habido problemas, debería dejarnos insertarlo

-- Salimos de et y nos conectamos con root para seguir con el ejercicio
exit;
mysql -u root -p;
root;

-- 7. Concedemos permisos de SELECT solo en las columnas nombre y cargo de la tabla TRIPULANTES
GRANT SELECT (nombre_tripulante, cargo_tripulante) ON galaxia.TRIPULANTES TO 'et'@'192.168.1.33';
SHOW GRANTS FOR 'et'@'localhost';

-- Nos conectamos con et para hacer un select y ver que funciona
exit;
mysql -u et -p -h 192.168.1.33;
etpassword;

USE galaxia;

SELECT nombre_tripulante, cargo_tripulante FROM galaxia.TRIPULANTES;