CREATE DATABASE IF NOT EXISTS empresa_db;

USE empresa_db;

CREATE TABLE IF NOT EXISTS CLIENTES (
    dni CHAR(9) PRIMARY KEY,
    nom VARCHAR(50),
    direccion VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS PAGOS_PENDIENTES (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    dni CHAR(9),
    importe DOUBLE,
    FOREIGN KEY (dni) REFERENCES CLIENTES(dni) ON DELETE NO ACTION ON UPDATE NO ACTION
);

DESCRIBE CLIENTES;
DESCRIBE PAGOS_PENDIENTES;

INSERT INTO CLIENTES VALUES ('73849508I', 'Pikachu', 'C/ de la Concordia, 34');
INSERT INTO PAGOS_PENDIENTES (dni, importe) VALUES ('73849508I', 467);
INSERT INTO PAGOS_PENDIENTES (dni, importe) VALUES ('73849508I', 56.7);

-- Estas tres funciones no se pueden ejecutar todas a la vez porque dan errores cada una de ellas por no estar permitida ninguna de las acciones realizadas.
DELETE FROM CLIENTES WHERE nom = 'Pikachu';
UPDATE CLIENTES SET dni = '75647389U' WHERE nom = 'Pikachu';
DELETE FROM CLIENTES;