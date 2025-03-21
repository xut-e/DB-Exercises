-- Me conecto como root
mysql -u root -p;
root;

-- Creo la base de datos
CREATE DATABASE IF NOT EXISTS galaxia;

-- La uso para crear las tablas
USE galaxia;

-- Creo las tablas, con sus respectivas PRIMARY KEYs 
CREATE TABLE IF NOT EXISTS PLANETAS (
    id_planeta INT AUTO_INCREMENT PRIMARY KEY,
    nombre_planeta VARCHAR(10) NOT NULL
);

-- Hago el CHECK para evitar la introducción de números no válidos
CREATE TABLE IF NOT EXISTS NAVES (
    id_nave INT AUTO_INCREMENT PRIMARY KEY,
    nombre_nave VARCHAR(15) NOT NULL,
    capacidad_nave INT CHECK (capacidad_nave > 0) NOT NULL
);

CREATE TABLE IF NOT EXISTS TRIPULANTES (
    id_tripulante INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tripulante VARCHAR(25) NOT NULL,
    cargo_tripulante ENUM('Capitán', 'Piloto', 'Ingeniero', 'Oficial', 'Tripulante') NOT NULL
);
