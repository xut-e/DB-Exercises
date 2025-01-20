mysql -u root -p;
root;

CREATE USER 'navi'@'localhost';
GRANT USAGE ON *.* TO 'navi'@'localhost';
SHOW GRANTS FOR 'navi'@'localhost';

CREATE USER 'skullkid'@'localhost' IDENTIFIED BY 'skullkidpassword';
GRANT USAGE ON *.* FOR 'skullkid'@'localhost';
SHOW GRANTS FOR 'skullkid'@'localhost';

GRANT SELECT ON hyrule.heroes TO 'skullkid'@'localhost';
SHOW GRANTS FOR 'skullkid'@'localhost';

GRANT SELECT, INSERT, UPDATE ON hyrule.* TO 'navi'@'localhost' WITH GRANT OPTION;
SHOW GRANTS FOR 'navi'@'localhost';

exit;
mysql -u 'navi'@'localhost' -p;
GRANT SELECT ON hyrule.mascaras TO 'skullkid'@'localhost';
SHOW GRANTS FOR 'skullkid'@'localhost';

REVOKE SELECT ON hyrule.heroes TO 'skullkid'@'localhost';
SHOW GRANTS FOR 'skullkid'@'localhost';

exit;
mysql -u root -p;
root;
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'navi'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'skullkid'@'localhost';

GRANT SELECT (id_arma, nombre) ON hyrule.armas TO 'skullkid'@'localhost';

exit;
mysql -u 'skullkid'@'localhost' -p;
skullkidpassword;

SELECT * FROM hyrule.armas;

-- Nos deja porque todas las columnas (*) son las que hemos seleccionado.

DROP USER 'navi'@'localhost';

SELECT * FROM mysql.user WHERE USER IN ('navi', 'skullkid');
SELECT * FROM information_schema.user_privileges WHERE GRANTEE LIKE "'skullkid'%";