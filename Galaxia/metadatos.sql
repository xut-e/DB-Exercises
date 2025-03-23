mysql -u root -p;
root;

-- 11. Consultamos los privilegios de los usuarios sobre las tablas
SELECT USERS.user, USERS.host, PRIVILEGIOS.table_name, PRIVILEGIOS.table_priv FROM mysql.user AS USERS JOIN mysql.db AS DB ON USERS.user = DB.user AND USERS.host = DB.host JOIN mysql.tables_priv AS PRIVILEGIOS ON DB.db = PRIVILEGIOS.db WHERE DB.db = 'galaxia';
-- Seleccionamos la información a extraer, en mi caso he decidido usuarios y host (porque los usuarios en la base de datos se identifican con ambos), el nombre de la tabla y el tipo de privilegios que tiene cada usuario. Uso AS para no tener que poner en cada tabla la BD a la que pertenece al usar alias.

-- 12. Consultamos el número de filas de cada tabla de la base de datos galaxia
SELECT table_name, table_rows FROM information_schema.tables WHERE table_schema = 'galaxia';

-- 13. Consultamos las columnas de la tabla TRIPULANTES
SELECT column_name, data_type, is_nullable FROM information_schema.columns WHERE table_schema = 'galaxia' AND table_name = 'TRIPULANTES';