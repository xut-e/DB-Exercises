CREATE DATABASE IF NOT EXISTS taller;

USE taller;

CREATE TABLE IF NOT EXISTS MECANICOS (
    dni CHAR(9) PRIMARY KEY,
    nombre VARCHAR(20),
    edad TINYINT UNSIGNED
);

CREATE TABLE IF NOT EXISTS VEHICULOS (
    matricula CHAR(7) PRIMARY KEY,
    propietario VARCHAR(20),
    marca VARCHAR(20),
    reparado_por CHAR(9),
    FOREIGN KEY (reparado_por) REFERENCES MECANICOS(dni) ON DELETE SET NULL ON UPDATE SET NULL
);


INSERT INTO MECANICOS VALUES ('45645645A', 'Ernest', '27');
INSERT INTO MECANICOS VALUES ('47147147Z', 'Carla', '28');
INSERT INTO MECANICOS VALUES ('46946946P', 'Maria', '18');

INSERT INTO VEHICULOS VALUES ('4545RER', 'Josep', 'Volkswagen', '47147147Z');
INSERT INTO VEHICULOS VALUES ('6565DEF', 'Anna', 'Citroen', '47147147Z');

SELECT * FROM MECANICOS;
SELECT * FROM VEHICULOS;

-- Ahora cuando lo updateamos la tabla quedará vacía.
UPDATE VEHICULOS SET matricula = '4141FDR' WHERE propietario = 'Josep';

DELETE FROM CLIENTES WHERE propietario = 'Josep';