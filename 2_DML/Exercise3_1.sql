CREATE DATABASE IF NOT EXISTS refugio;

USE refugio;

CREATE TABLE IF NOT EXISTS ANIMALES (
    nombre VARCHAR(15),
    tipo CHAR(10),
    raza VARCHAR(10),
    peso INT UNSIGNED,
    color VARCHAR(15),
    edad TINYINT
);

INSERT INTO ANIMALES (nombre, tipo, raza, peso, color, edad) VALUES (
('Luna', 'Perro', 'Labrador', 25, 'Negro', 3),
('Milo', 'Gato', 'Siames', 4, 'Gris', 2),
('Rocky', 'Perro', 'Pitbull', 30, 'Blanco', 4),
('Bella', 'Conejo', 'MiniLop', 2, 'Marrón', 1),
('Max', 'Perro', 'Beagle', 12, 'Tricolor', 5),
('Simba', 'Gato', 'Persa', 6, 'Blanco', 3)
);

SELECT nombre, raza FROM ANIMALES;
SELECT nombre AS "Nombre del animal", peso AS "Peso (kg)" FROM ANIMALES;
SELECT nombre, DATE_SUB(NOW(), INTERVAL edad YEAR) AS dia_nacimiento FROM ANIMALES;
