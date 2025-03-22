-- 8. Crear el rol xenomorfo con todos los privilegios sobre PLANETAS y TRIPULANTES y el rol metahumano con todos los privilegios sobre NAVES
mysql -u root -p;
root;

CREATE ROLE IF NOT EXISTS xenomorfo;
GRANT ALL PRIVILEGES ON galaxia.PLANETAS, galaxia.TRIPULANTES TO xenomorfo;

CREATE ROLE IF NOT EXISTS metahumano;
GRANT ALL PRIVILEGES ON galaxia.NAVES TO metahumano;

SELECT user FROM mysql.user WHERE user IN ('xenomorfo', 'metahumano');
SHOW GRANTS FOR xenomorfo;
SHOW GRANTS FOR metahumano;

-- 9. Le asignamos el rol metahumano a clark de manera predeterminada
GRANT metahumano TO 'clark'@'localhost';
SET DEFAULT ROLE metahumano FOR 'clark'@'localhost';

-- Salimos de root y entramos en clark para comprobar el rol
exit;
mysql -u clark -p;
clarkpassword;

SELECT CURRENT_ROLE();
-- Si el resultado es metahumano, es que no ha habido ningún problema

-- Salimos de clark y nos conectamos como root para seguir el ejercicio
exit;
mysql -u root -p;
root;

-- 10. Le damos el rol xenomorfo a clark, nos conectamos con clark y activamos el nuevo rol
GRANT xenomorfo TO 'clark'@'localhost';

exit;
mysql -u clark -p;
clarkpassword;

-- Comprobamos que inicialmente no podemos hacer SELECT de la tabla PLANETAS, por ejemplo
SELECT * FROM galaxia.PLANETAS;
-- Esto debería darnos un error

SET ROLE xenomorfo;
SELECT CURRENT_ROLE();
-- Esto debería retornarnos xenomorfo si todo ha ido bien, ahora ya podemos conultar las tablas PLANETAS y TRIPULANTES

SELECT * FROM galaxia.PLANETAS;
SELECT * FROM galaxia.TRIPULANTES;