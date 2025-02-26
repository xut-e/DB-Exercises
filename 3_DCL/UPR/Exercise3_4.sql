mysql -u root -p;
root;

CREATE ROLE IF NOT EXISTS DOCTOR;
GRANT SELECT ON hyrule.heroes TO DOCTOR;
GRANT UPDATE ON hyrule.heroes TO DOCTOR;

CREATE ROLE IF NOT EXISTS CIENTIFICO;
GRANT INSERT ON hyrule.armas TO CIENTIFICO;

CREATE ROLE IF NOT EXISTS PERIODISTA;
GRANT SELECT ON hyrule.* TO PERIODISTA;

-- Estableceremos para el ejemplo la ip del cliente como 10.65.0.2.
CREATE USER IF NOT EXISTS 'clark_kent'@'10.65.0.2' IDENTIFIED BY 'contrasenyaCLARK_KENT';
GRANT PERIODISTA TO 'clark_kent'@'10.65.0.2';

CREATE USER IF NOT EXISTS 'bruce_wayne'@'%' IDENTIFIED BY 'contrasenyaBRUCE_WAYNE';
GRANT CIENTIFICO TO 'bruce_wayne'@'%';

exit;
mysql -u clark_kent -p -h 10.65.0.2;
contrasenyaCLARK_KENT;

-- Ambas deberían funcionar ya que PERIODISTA tiene SELECT sobre todas las tablas de hyrule.
SELECT * FROM hyrule.heroes;
SELECT * FROM hyrule.mascaras;

exit;
mysql -u bruce_wayne -p;
contrasenyaBRUCE_WAYNE;

-- Debería funcionar porque CIENTIFICO tiene INSERT.
INSERT INTO hyrule.armas (nombre) VALUES ('Boomerang');

-- Esta debería fallar porque CIENTIFICO no tiene SELECT.
SELECT * FROM hyrule.armas;

exit;
mysql -u root -p;
root;

GRANT DOCTOR TO 'clark_kent'@'10.65.0.2';

exit;
mysql -u clark_kent -p -h 10.65.0.2;
contrasenyaCLARK_KENT;

UPDATE hyrule.heroes SET nombre = 'Superman' WHERE id = 1;

SET ROLE PERIODISTA;

-- Esta debería fallar.
UPDATE hyrule.heroes SET nombre = 'Batman' WHERE id = 2;

exit;
mysql -u root -p;
root;

DROP USER IF EXISTS 'clark_kent'@'10.65.0.2';
DROP USER IF EXISTS 'bruce_wayne'@'%';