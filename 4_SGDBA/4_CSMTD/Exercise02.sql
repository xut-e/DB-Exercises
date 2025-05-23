-- A) Tabla mecanicos

CREATE TABLE IF NOT EXISTS mecanicos (
    dni CHAR(9) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    edad SMALLINT CHECK (edad >= 18 AND edad <= 65),
    poblacion VARCHAR(20)
);

-- B) Tablas vehiculos y reparaciones

CREATE TABLE vehiculos (
    matricula CHAR(7) PRIMARY KEY,
    propietario VARCHAR(50) NOT NULL,
    marca VARCHAR(20) NOT NULL
);

CREATE TABLE reparaciones (
    id SERIAL PRIMARY KEY,
    dni_mecanico CHAR(9) REFERENCES mecanicos(dni),
    matricula_vehiculo CHAR(7) REFERENCES vehiculos(matricula),
    fecha DATE NOT NULL DEFAULT CURRENT_DATE
);

-- C) Inserción de datos

INSERT INTO mecanicos (dni, nombre, edad, poblacion) VALUES (
    ('45645645A', 'Ernest', 27, 'Manresa'),
    ('46946946P', 'Maria', 18, 'Barcelona'),
    ('47147147Z', 'Carla', 28, 'Barcelona'),
    ('48248248B', 'Jordi', 35, 'Girona')
);

INSERT INTO vehiculos (matricula, propietario, marca) VALUES (
    ('1121JKL', 'Laura', 'BMW'),
    ('1234ABC', 'Pere', 'Ford'),
    ('3141MNO', 'Sofia', 'Mercedes')
);

INSERT INTO reparaciones (dni_mecanico, matricula_vehiculo, fecha) VALUES (
    ('45645645A', '1234ABC', '2024-01-15'),
    ('46946946P', '1121JKL', '2024-02-20'),
    ('47147147Z', '3141MNO', '2024-03-10'),
    ('48248248B', '1234ABC', '2024-07-15')
);

-- Verificación

SELECT reparaciones.id AS reparacion_id, mecanicos.nombre AS mecanico, vehiculos.matricula, vehiculos.marca, reparaciones.fecha
FROM reparaciones JOIN mecanicos ON reparaciones.dni_mecanico = mecanicos.dni
LEFT JOIN vehiculos ON reparaciones.matricula_vehiculo = vehiculos.matricula;