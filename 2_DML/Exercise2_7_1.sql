USE zoologico;

INSERT INTO ZOO (id_zoo, nombre, ciudad, pais, presupuesto, superficie)
VALUES
('Z00001', 'Safari Park', 'Nairobi', 'KEN', 500000, 15000),
('Z00002', 'Rainforest Zoo', 'Manaus', 'BRA', 300000, 20000),
('Z00003', 'Desert Zoo', 'Phoenix', 'USA', 250000, 12000),
('Z00004', 'Tundra Park', 'Oslo', 'NOR', 400000, 18000),
('Z00005', 'Oceanic Zoo', 'Sydney', 'AUS', 600000, 25000);

INSERT INTO ESPECIE (nombre_vulgar, nombre_cientifico, familia, peligro_extincion)
VALUES
('León', 'Panthera leo', 'Felidae', TRUE),
('Elefante', 'Loxodonta africana', 'Elephantidae', TRUE),
('Pingüino', 'Aptenodytes forsteri', 'Spheniscidae', FALSE),
('Canguro', 'Macropus rufus', 'Macropodidae', FALSE),
('Jaguar', 'Panthera onca', 'Felidae', TRUE);

INSERT INTO ANIMAL (id_animal, numero_identificacion, sexo, pais_origen, continente, zoo_pertenece, especie_pertenece)
VALUES
('A001', '123456', TRUE, 'KEN', 'África', 'Z00001', 1), -- León en Safari Park
('A002', '654321', FALSE, 'KEN', 'África', 'Z00001', 2), -- Elefante en Safari Park
('A003', '112233', FALSE, 'BRA', 'América', 'Z00002', 5), -- Jaguar en Rainforest Zoo
('A004', '445566', TRUE, 'NOR', 'Europa', 'Z00004', 3), -- Pingüino en Tundra Park
('A005', '778899', TRUE, 'AUS', 'Oceanía', 'Z00005', 4); -- Canguro en Oceanic Zoo
