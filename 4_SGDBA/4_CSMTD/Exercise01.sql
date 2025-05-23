-- A) Creacion de la tabla desarrolladores

CREATE TABLE IF NOT EXISTS desarrolladores (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL
);

-- B) Creación de la tabla videojuegos

CREATE TABLE IF NOT EXISTS videojuegos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    genero VARCHAR(20) CHECK (genero IN ('SURVIVAL', 'RPG', 'METROIDVANIA', 'ACTION ADVENTURE')),
    precio NUMERIC(6,2) NOT NULL,
    img_portada BYTEA,
    id_desarrollador INTEGER REFERENCES desarrolladores(id)
);

-- C) Inserción de datos

INSERT INTO desarrolladores (id, nombre) VALUES (
    (1, 'Team Cherry'), 
    (2, 'Konami'), 
    (3, 'Valve')
);

INSERT INTO videojuegos (id, nombre, fecha_lanzamiento, genero, precio, img_portada, id_desarrollador) VALUES (
    (1, 'Hollow Knight', '2017-02-24', 'METROIDVANIA', 14.99, NULL, 1),
    (2, 'Silent Hill 2', '2001-09-24', 'SURVIVAL', 49.99, NULL, 2),
    (3, 'Portal', '2007-10-10', 'ACTION ADVENTURE', 19.99, NULL, 3)
);

-- Verificación
SELECT * FROM desarrolladores;
SELECT * FROM videojuegos;

SELECT videojuegos.nombre AS videojuego, videojuegos.genero, videojuegos.precio, desarrolladores.nombre AS desarrollador FROM videojuegos JOIN desarrolladores ON videojuegos.id_desarrollador = desarrolladores.id;
