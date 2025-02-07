CREATE DATABASE IF NOT EXISTS hyrule;

USE hyrule;

CREATE TABLE IF NOT EXISTS heroes (
    id_heroe INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    clase ENUM('Mago', 'Guerrero', 'Tirador', 'Asesino', 'Tanque', 'Curandero') DEFAULT 'Guerrero' NOT NULL,
    rango ENUM('Heroe', 'Rey_Reina', 'Principe_Princesa', 'General', 'Sabio', 'Raso') DEFAULT 'Raso' NOT NULL
);

CREATE TABLE IF NOT EXISTS mascaras (
    id_mascara INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    descripcion TEXT
);

CREATE TABLE IF NOT EXISTS armas (
    id_arma INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL
);

-- Inserción corregida con valores exactos según ENUM
INSERT INTO heroes (nombre, clase, rango) VALUES
('Link', 'Guerrero', 'Heroe'),
('Zelda', 'Mago', 'Rey_Reina'),
('Daruk', 'Tanque', 'General'),
('Mipha', 'Curandero', 'Principe_Princesa');

INSERT INTO mascaras (nombre, descripcion) VALUES
('Máscara de Majora', 'Una máscara mística con poder oscuro.'),
('Máscara de la Verdad', 'Permite ver lo que no se ve a simple vista.'),
('Máscara de Kafei', 'Máscara usada para encontrar a Kafei.'),
('Máscara de Goron', 'Te transforma en un Goron.');

INSERT INTO armas (nombre) VALUES
('Espada Maestra'),
('Hacha de Guerra'),
('Arco del Héroe'),
('Cetro de la Sabiduría');

