mysql -u root -p;
root;

CREATE USER IF NOT EXISTS 'hector'@'172.31.99.230' IDENTIFIED BY 'contraseñaHector';

GRANT SELECT ON hyrule.* TO 'hector'@'172.31.99.230';
SHOW GRANTS FOR 'hector'@'172.31.99.230';

REVOKE ALL PRIVILEGES FROM 'hector'@'172.31.99.230';

CREATE DATABASE IF NOT EXISTS otraTabla;

GRANT CREATE ON otraTabla.* TO 'hector'@'172.31.99.230';

exit;
mysql -u hector -p;
contraseñaHector;

USE otraTabla;

CREATE TABLE IF NOT EXISTS HOLA (
    saludo VARCHAR(20) PRIMARY KEY,
    persona VARCHAR(20)
);

-- Esta consulta dará error porque no tiene los permisos necesarios.
SELECT * FROM HOLA;

exit;

mysql -u root - p;
root;

DROP USER IF EXISTS 'hector'@'172.31.99.230';

SELECT * FROM mysql.user WHERE User = 'skullkid' AND Host = 'localhost';
SELECT * FROM mysql.db WHERE User = 'skullkid' AND Host = 'localhost';
SELECT * FROM mysql.tables_priv WHERE User = 'skullkid' AND Host = 'localhost';
SELECT * FROM mysql.columns_priv WHERE User = 'skullkid' AND Host = 'localhost';