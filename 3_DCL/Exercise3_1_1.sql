CREATE DATABASE IF NOT EXISTS hyrule;

USE hyrule;

CREATE TABLE IF NOT EXISTS heroes (
    id_heroe INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    clase ENUM('Mago', 'Guerrero', 'Tirador', 'Asesino', 'Tanque', 'Curandero') DEFAULT 'Guerrero' NOT NULL,
    rango ENUM('Heroe', 'Rey/Reina', 'Principe/Princesa', 'General', 'Sabio', 'Raso') DEFAULT 'Raso' NOT NULL
);

CREATE TABLE IF NOT EXISTS mascaras (
    id_mascara INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    descripcion TEXT
);

CREATE TABLE IF NOT EXISTS armas (
    id_arma INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL
);

INSERT INTO heroes (nombre, clase, rango) VALUES
('Link', 'Guerrero', 'Heroe'),
('Zelda', 'Mago', 'Reina'),
('Daruk', 'Tanque', 'General'),
('Mipha', 'Curandero', 'Princesa');

INSERT INTO mascaras (nombre, descripcion) VALUES
('Máscara de Majora', 'Una máscara mística amb poder fosc.'),
('Máscara de la Verdad', 'Permet veure el que no es veu a simple vista.'),
('Máscara de Kafei', 'Mascara usada per trobar a Kafei.'),
('Máscara de Goron', 'Et transforma en un Goron.');

INSERT INTO armas (nombre) VALUES
('Espada Maestra'),
('Hacha de Guerra'),
('Arco del Héroe'),
('Cetro de la Sabiduría');