mysql -u root -p;
root;

CREATE ROLE IF NOT EXISTS ORNI;
GRANT ALL PRIVILEGES ON hyrule.heroes TO ORNI;
GRANT ALL PRIVILEGES ON hyrule.mascaras TO ORNI;

CREATE ROLE IF NOT EXISTS GERUDO;
GRANT ALL PRIVILEGES ON hyrule.armas TO GERUDO;

CREATE USER IF NOT EXISTS 'ganon'@'localhost' IDENTIFIED BY 'contrasenyaGANON';
GRANT GERUDO TO 'ganon'@'localhost';
SET DEFAULT ROLE GERUDO FOR 'ganon'@'localhost';

exit;
mysql -u ganon -p;
contrasenyaGANON;

-- Esta consulta falla porque GERUDO no tiene permisos para ello.
SELECT * FROM hyrule.heroes;

-- Esta otra si que vale porque GERUDO sí que tiene permisos sobre esta tabla.
SELECT * FROM hyrule.armas;

exit;
mysql -u root -p;
root;

GRANT ORNI TO 'ganon'@'localhost';

exit;
mysql -u ganon -p;
contrasenyaGANON;

-- Esta consulta debería funcionar.
SELECT * FROM hyrule.armas;

SET ROLE ORNI;

SELECT * FROM hyrule.armas;

SET ROLE NONE;

-- Esta consulta no funcionará.
SELECT * FROM hyrule.heroes;