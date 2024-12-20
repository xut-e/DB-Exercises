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
    nombre VARCHAR(20),
);