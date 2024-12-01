CREATE DATABASE buffette;

USE buffette;

CREATE TABLE PROCURADOR (
    id_procurador VARCHAR(9) PRIMARY KEY,
    nombre VARCHAR(20),
    dni CHAR(9),
    direccion VARCHAR(40)
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
    fecha_final DATE,
    estado BOOLEAN,
    id_cliente VARCHAR(9),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DIRECCION_CASO (
    id_caso VARCHAR(15),
    FOREIGN KEY (id_caso) REFERENCES CASO(id_caso) ON DELETE CASCADE ON UPDATE CASCADE,
    id_procurador VARCHAR(9),
    FOREIGN KEY (id_procurador) REFERENCES PROCURADOR(id_procurador) ON DELETE CASCADE ON UPDATE CASCADE,
    ganado BOOLEAN
);

DESCRIBE PROCURADOR;
DESCRIBE CASO;
DESCRIBE DIRECCION_CASO;
DESCRIBE CLIENTE;