-- Insertamos más datos en las tablas para que las vistas tengan sentido funcional
INSERT INTO mecanicos VALUES 
('11111111A', 'Joan Martínez', 40, 'Barcelona'),
('22222222B', 'Pere Puig', 35, 'Lleida'),
('33333333C', 'Anna Soler', 28, 'Tarragona'),
('44444444D', 'Marc Vila', 45, 'Girona'),
('55555555E', 'Laura Roca', 32, 'Manresa');

INSERT INTO vehiculos VALUES
('1234ABC', 'Carlos Ruiz', 'Seat', '11111111A'),
('5678DEF', 'Ana Torres', 'Ford', NULL),
('9012GHI', 'Luis Sánchez', 'Volvo', '22222222B'),
('2468JKL', 'Marta López', 'Renault', NULL),
('1357MNO', 'Jordi Costa', 'Peugeot', NULL);

-- A) Crear la vista mecanicos_capital (Barcelona)
CREATE VIEW mecanicos_capital AS
SELECT dni, nombre, edad, poblacion FROM mecanicos WHERE poblacion = 'Barcelona';

-- B) Modificamos la vista mecanicos_capital para incluir otras capitales
ALTER VIWE mecanicos_capital AS
SELECT dni, nombre, edad, poblacion FROM mecanicos WHERE poblacion IN ('Barcelona', 'Lleida', 'Tarragona', 'Girona');

-- C) Creamos la vista vehiculos_sin_reparar
CREATE VIEW vehiculos_sin_reparar AS
SELECT matricula, propietario, marca FROM vehiculos WHERE reparado_por IS NULL;

-- D) Consultamos la definicion de las vistas
SELECT table_name AS vista, view_definition AS definicion FROM information_schema.views WHERE table_schema = 'taller';