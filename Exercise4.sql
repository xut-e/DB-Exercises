CREATE DATABASE IF NOT EXISTS plantilla_empleados;

USE plantilla_empleados;

CREATE TABLE IF NOT EXISTS REGION (
    codigo_region CHAR(2) PRIMARY KEY,
    nombre VARCHAR(21),
);

CREATE TABLE IF NOT EXISTS PROVINCIA (
    codigo_provincia CHAR(2) PRIMARY KEY,
    nombre VARCHAR(20),
    codigo_region char(2),
    FOREIGN KEY (codigo_region) REFERENCES REGION(codigo_region)
);

CREATE TABLE IF NOT EXISTS LOCALIDAD (
    codigo_localidad CHAR(3) PRIMARY KEY;
    nombre VARCHAR(20),
    codigo_provincia CHAR(2),
    FOREIGN KEY (codigo_provincia) REFERENCES PROVINCIA(codigo_provincia)
);

CREATE TABLE IF NOT EXISTS EMPLEADO (
    id_empleado VARCHAR(9) PRIMARY KEY,
    dni_empleado CHAR(9),
    nombre VARCHAR(20),
    telefono VARCHAR(9),
    salario_anual INT,
    localidad_nacimiento CHAR(20),
    FOREIGN KEY (localidad_nacimiento) REFERENCES LOCALIDAD(codigo_localidad)
);

DESCRIBE REGION;
DESCRIBE PROVINCIA;
DESCRIBE LOCALIDAD;
DESCRIBE EMPLEADO;
