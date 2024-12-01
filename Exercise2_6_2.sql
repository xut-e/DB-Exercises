USE buffette;

-- Insertar tres clientes con tres casos asociados cada uno.
INSERT INTO  CLIENTE (id_cliente, dni, nombre, direccion) VALUES 
('C00006', '64537829J', 'Carla Pérez', 'Calle Brisa 23'),
('C00007', '12354678K', 'Miguel Rodríguez', 'Avenida Mayor 123'),
('C00008', '83409637E', 'Lucía García', 'Plaza Oeste 4');

INSERT INTO CASO (id_caso, fecha_inicio, fecha_final, estado, id_cliente) VALUES
('CASO000006', '2024-01-01', NULL, TRUE, 'C00006'),
('CASO000007', '2024-02-01', NULL, TRUE, 'C00006'),
('CASO000008', '2024-03-01', NULL, TRUE, 'C00006');

INSERT INTO CASO (id_caso, fecha_inicio, fecha_final, estado, id_cliente) VALUES
('CASO000009', '2024-01-10', '2024-03-02', FALSE, 'C00007'),
('CASO000010', '2023-03-11', '2024-02-05', FALSE, 'C00007'),
('CASO000011', '2023-04-12', NULL, TRUE, 'C00007');

INSERT INTO CASO (id_caso, fecha_inicio, fecha_final, estado, id_cliente) VALUES
('CASO000012', '2024-02-08', '2024-02-28', FALSE, 'C00008'),
('CASO000013', '2023-03-03', '2024-05-02', FALSE, 'C00008'),
('CASO000014', '2024-05-12', NULL, TRUE, 'C00008');

-- Asignar a abogados 3 asuntos nuevos o de otro abogado.
UPDATE DIRECCION_CASO SET id_procurador = 'P00001' WHERE id_caso = 'CASO000006';
UPDATE DIRECCION_CASO SET id_procurador = 'P00002' WHERE id_caso = 'CASO000007';
UPDATE DIRECCION_CASO SET id_procurador = 'P00003' WHERE id_caso = 'CASO000002';

SELECT * FROM PROCURADOR;
SELECT * FROM CLIENTE;
SELECT * FROM CASO;
SELECT * FROM DIRECCION_CASO;

-- Borrar a un cliente y comprobar qué ha pasado.
DELETE FROM CLIENTE WHERE id_cliente = 'C00001';

SELECT * FROM PROCURADOR;
SELECT * FROM CLIENTE;
SELECT * FROM CASO;
SELECT * FROM DIRECCION_CASO;