-- Me conecto a mysql como root
mysql -u root -p

-- Uso la base de datos galaxia
USE galaxia;

-- Insertamos 5 planetas
INSERT INTO PLANETAS (nombre_planeta) VALUES
('Tierra'),
('Marte'),
('Venus'),
('Júpiter'),
('Saturno');

-- Insertamos 5 naves con nombres y capacidad válida
INSERT INTO NAVES (nombre_nave, capacidad_nave) VALUES
('Explorer-1', 5),
('Galaxy Cruiser', 8),
('Orion', 10),
('Nebula', 6),
('Voyager-X', 12);

-- Insertamos 5 tripulantes con nombres y roles coherentes
INSERT INTO TRIPULANTES (nombre_tripulante, cargo_tripulante) VALUES
('James Kirk', 'Capitán'),
('Han Solo', 'Piloto'),
('Ellen Ripley', 'Oficial'),
('Scotty', 'Ingeniero'),
('Buzz Aldrin', 'Tripulante');

-- Confirmamos que los datos se han insertado correctamente
SELECT * FROM PLANETAS;
SELECT * FROM NAVES;
SELECT * FROM TRIPULANTES;