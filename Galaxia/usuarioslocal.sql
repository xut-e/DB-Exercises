-- Me conecto como root
mysql -u root -p;
root;

-- Uso galaxia para crear usuarios
USE galaxia;

-- 1. Crear al usuario alien
CREATE USER IF NOT EXISTS 'alien'@'localhost' IDENTIFIED BY 'alienpassword';
-- Al no haberle asignado permisos de ningún tipo, este usuario sólo tendrá permisos de conexión
SHOW GRANTS FOR 'alien'@'localhost';

-- 2. Crear al usuario clark
CREATE USER IF NOT EXISTS 'clark'@'localhost' IDENTIFIED BY 'clarkpassword';
SHOW GRANTS FOR 'clark'@'localhost';

-- 3. Darle a clark permisos de SELECT en TRIPULANTES
GRANT SELECT ON galaxia.TRIPULANTES TO 'clark'@'localhost';
SHOW GRANTS FOR 'clark'@'localhost';

-- Me desconecto de root
exit;

-- Me conecto con clark para comprobar que puede hacer SELECT
mysql -u clark -p;
clarkpassword;

USE galaxia;

SELECT * FROM galaxia.TRIPULANTES;
-- Si todo ha ido bien deberíamos obtener los datos de todos los tripulantes

-- Salimos de clark y nos conectamos como root para seguir el ejercicio
exit;
mysql -u root -p;
root;

--4. Le damos permisos de SELECT, INSERT y UPDATE a alien en todas las tablas
GRANT SELECT, INSERT, UPDATE ON galaxia.* TO 'alien'@'localhost' WITH GRANT OPTION;
SHOW GRANTS FOR 'alien'@'localhost';

-- Salimos de root y nos conectamos como alien
exit;
mysql -u alien -p;
alienpassword;

USE galaxia;

-- 5. Concedemos permisos de SELECT a clark siendo alien
GRANT SELECT ON galaxia.NAVES TO 'clark'@'localhost';

-- Salimos de alien y nos conectamos como root
exit;
mysql -u root -p;
root;

SHOW GRANTS FOR 'clark'@'localhost';