USE buffette;

SHOW CREATE TABLE CASO;
SHOW CREATE TABLE DIRECCION_CASO;

ALTER TABLE CASO DROP CONSTRAINT caso_ibfk_1;
ALTER TABLE DIRECCION_CASO DROP CONSTRAINT direccion_caso_ibfk_1;
ALTER TABLE DIRECCION_CASO DROP CONSTRAINT direccion_caso_ibfk_2;

SHOW CREATE TABLE CASO;
SHOW CREATE TABLE DIRECCION_CASO;