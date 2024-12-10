CREATE DATABASE IF NOT EXISTS videojuegos;

USE videojuegos;

CREATE TABLE videojocs (
    ID int UNSIGNED PRIMARY KEY,
    Nom VARCHAR(45),
    Data_sortida DATE,
    Desenvolupador VARCHAR(25),
    Genere ENUM('SURVIVAL','ACTION RPG', 'METROIDVANIA', 'ACTION ADVENTURE'),
    Preu float(6,2),
    Img_Portada BLOB
);

INSERT INTO videojocs (ID, Nom, Data_sortida, Desenvolupador, Genere, Preu, Img_Portada) VALUES 
(1, 'Silent Hill 2', '2024-10-08', 'Bloober Team SA', 'SURVIVAL', 69.99, NULL),
(34, 'Black Myth: Wukong', '2024-08-20', 'Game Science', 'ACTION RPG', 59.99, DEFAULT),
(79, 'Hollow Knight', '2017-02-24', 'Team Cherry', 'METROIDVANIA', 14.79, NULL),
(2, 'Resident Evil Village', '2021-05-07', 'Capcom', 'SURVIVAL', 59.99, NULL),
(3, 'Elden Ring', '2022-02-25', 'FromSoftware', 'ACTION RPG', 69.99, NULL),
(4, 'Ori and the Will of the Wisps', '2020-03-11', 'Moon Studios', 'METROIDVANIA', 29.99, NULL),
(5, 'The Last of Us Part II', '2020-06-19', 'Naughty Dog', 'ACTION ADVENTURE', 59.99, NULL),
(6, 'Cyberpunk 2077', '2020-12-10', 'CD Projekt', 'ACTION RPG', 49.99, NULL),
(7, 'Alien: Isolation', '2014-10-07', 'Creative Assembly', 'SURVIVAL', 39.99, NULL);

SELECT Nom, Preu * 165.43 AS Preu_Yen FROM videojocs WHERE Preu BETWEEN 40 AND 60;
