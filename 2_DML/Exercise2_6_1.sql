USE buffette;

-- Inserciones para PROCURADOR.
INSERT INTO PROCURADOR (id_procurador, nombre, dni, direccion) VALUES
('P00001', 'Ana López', '12345678A', 'Calle Mayor 10'),
('P00002', 'Carlos Ruiz', '87654321B', 'Avenida Central 23'),
('P00003', 'Laura Gómez', '23456789C', 'Calle Luna 7'),
('P00004', 'Marcos Díaz', '34567890D', 'Calle Sol 5'),
('P00005', 'Lucía Fernández', '45678901E', 'Plaza Norte 15');

-- Inserciones para CLIENTE.
INSERT INTO CLIENTE (id_cliente, dni, nombre, direccion) VALUES
('C00001', '11223344F', 'Jorge Martínez', 'Calle Verde 12'),
('C00002', '22334455G', 'María Pérez', 'Avenida Azul 34'),
('C00003', '33445566H', 'David Sánchez', 'Calle Roja 56'),
('C00004', '44556677I', 'Isabel Torres', 'Calle Amarilla 78'),
('C00005', '55667788J', 'Juan Hernández', 'Plaza Blanca 90');

-- Inserciones para CASO.
INSERT INTO CASO (id_caso, fecha_inicio, fecha_final, estado, id_cliente) VALUES
('CASO000001', '2023-01-15', '2023-06-15', FALSE, 'C00001'),
('CASO000002', '2023-02-10', '2023-07-20', FALSE, 'C00001'),
('CASO000003', '2023-03-05', '2024-01-15', FALSE, 'C00001'),
('CASO000004', '2023-04-01', NULL, TRUE, 'C00002'),
('CASO000005', '2023-05-12', NULL, TRUE, 'C00003');

-- Inserciones para DIRECCION_CASO.
INSERT INTO DIRECCION_CASO (id_caso, id_procurador, ganado) VALUES
('CASO000001', 'P00001', TRUE),
('CASO000002', 'P00002', FALSE),
('CASO000003', 'P00003', TRUE),
('CASO000004', 'P00004', NULL),
('CASO000005', 'P00005', NULL);
