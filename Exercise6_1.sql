CREATE DATABASE IF NOT EXISTS zoologico;

USE zoologico;

CREATE TABLE IF NOT EXISTS ZOO (
    id_zoo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(20),
    ciudad VARCHAR(20),
    pais VARCHAR(10),
    presupuesto INT UNSIGNED,
    superficie INT UNSIGNED,
    CONSTRAINT comprobar_superficie CHECK (superficie BETWEEN 1000 AND 1000000)
);

CREATE TABLE IF NOT EXISTS ESPECIE (
    id_especie VARCHAR(10) AUTO_INCREMENT PRIMARY KEY,
    nombre_vulgar VARCHAR(15),
    nombre_cientifico VARCHAR(25),
    familia VARCHAR(15),
    peligro_extincion BOOLEAN
);

CREATE TABLE IF NOT EXISTS ANIMAL (
    id_animal VARCHAR(10) PRIMARY KEY,
    numero_identificacion VARCHAR(6),
    sexo BOOLEAN,
    pais_origen VARCHAR(10),
    continente VARCHAR(9),
    zoo_pertenece VARCHAR(10),
    FOREIGN KEY (zoo_pertenece) REFERENCES ZOO(id_zoo) ON DELETE SET NULL ON UPDATE CASCADE,
    especie_pertenece VARCHAR(10),
    FOREIGN KEY (especie_pertenece) REFERENCES ESPECIE(id_especie) ON DELETE SET NULL ON UPDATE CASCADE
);

DESCRIBE ZOO;
DESCRIBE ESPECIE;
DESCRIBE ANIMAL;