CREATE DATABASE buffette;

USE buffette;

CREATE TABLE PROCURADOR (
    id_procurador VARCHAR(9) PRIMARY KEY,
    nombre VARCHAR(20),
    dni CHAR(9),
    direccion (40)
);

CREATE TABLE CLIENTE (
    id_cliente VARCHAR(9) PRIMARY KEY,
    dni CHAR(9),
    nombre VARCHAR(20),
    direccion VARCHAR(40)
);

CREATE TABLE CASO (
    id_caso VARCHAR(15) PRIMARY KEY,
    fecha_inicio DATE,
    CONSTRAINT comprobar_fecha_inicio CHECK (fecha_inicio REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$')
    fecha_final DATE,
    CONSTRAINT comprobar_fecha_final CHECK (fecha_final REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$')
    estado BOOLEAN
    id_cliente VARCHAR(9) REFERENCES CLIENTE(id_cliente) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE DIRECCION_CASO (
    id_caso VARCHAR(15) REFERENCES CASO(id_caso) ON DELETE SET NULL ON UPDATE CASCADE,
    id_procurador VARCHAR(9) REFERENCES PROCURADOR(id_procurador) ON DELETE SET NULL ON UPDATE CASCADE,
    ganado BOOLEAN
);

DESCRIBE PROCURADOR;
DESCRIBE CASO;
DESCRIBE DIRECCION_CASO;
DESCRIBE CLIENTE;