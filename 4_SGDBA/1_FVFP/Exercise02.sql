-- Primero creamos la base de datos con sus tablas
CREATE DATABASE IF NOT EXISTS taller;
USE taller;

CREATE TABLE IF NOT EXISTS mecanicos (
    dni VARCHAR(9) PRIMARY KEY ,
    nombre VARCHAR(50) NOT NULL,
    edad INT,
    poblacion VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS vehiculos (
    matricula VARCHAR(10) PRIMARY KEY,
    propietario VARCHAR(50) NOT NULL,
    marca VARCHAR(20) NOT NULL,
    reparado_por VARCHAR(9),
    FOREIGN KEY (reparado_por) REFERENCES mecanicos(dni)
);

-- Insertamos algunos datos
INSERT INTO mecanicos VALUES 
('12345678A', 'Joan Pérez', 35, 'Barcelona'),
('87654321B', 'Maria Gómez', 42, 'Madrid');

INSERT INTO vehiculos VALUES
('1234ABC', 'Carlos Ruiz', 'Mercedes', '12345678A'),
('5678DEF', 'Ana Torres', 'BMW', '87654321B'),
('9012GHI', 'Luis Sánchez', 'Audi', '12345678A');

-- A) Creamos la vista vehiculos_alemania para los mercedes
CREATE VIEW vehiculos_alemania AS
SELECT matricula, propietario, marca FROM vehiculos WHERE marca = 'Mercedes';

-- B) Modificamos la vista para incluir a los BMW
ALTER VIEW vehiculos_alemania AS
SELECT matricula, propietario, marca FROM vehiculos WHERE marca IN ('Mercedes', 'BMW');

-- C) Creamos la vista mecanico_vehiculos_reparados
CREATE VIEW mecanico_vehiculos_reparados AS
SELECT mecanicos.nombre AS mecanico, vehiculos.matricula AS vehiculo_reparado FROM mecanicos JOIN vehiculos ON mecanicos.dni = vehiculos.reparado_por;

-- D) Consultar la definicion de las vistas
SELECT table_name, view_definition
FROM information_schema.views WHERE table_schema = 'taller';