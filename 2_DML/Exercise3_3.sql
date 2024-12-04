USE centro_estudios;

INSERT INTO ALUMNO (id_matricula, nombre, telefono, dia_nacimiento)
VALUES
('A123456789001', 'Juan Pérez', '612345678', '2000-05-12'),
('A123456789002', 'Ana García', '623456789', '1998-09-15'),
('A123456789003', 'Luis Gómez', '634567890', '1999-11-22'),
('A123456789004', 'Maria López', '645678901', '2001-01-05'),
('A123456789005', 'Carlos Sánchez', '656789012', '1997-04-10'),
('A123456789006', 'Lucía Martín', '667890123', '2000-07-22');

INSERT INTO PROFESOR (id_profesor, nif_profesor, nombre, telefono)
VALUES
('P001', '12345678A', 'Carlos Martínez', '644123456'),
('P002', '87654321B', 'Elena López', '645654321'),
('P003', '11223344C', 'Miguel Sánchez', '646765432'),
('P004', '44556677D', 'Laura Rodríguez', '647876543'),
('P005', '99887766E', 'José García', '648987654'),
('P006', '12348877F', 'Ana Torres', '649876543');

INSERT INTO ASIGNATURA (id_asignatura, nombre, codigo_profesor)
VALUES
('MAT01', 'Matemáticas', 'P001'),
('FIS02', 'Física', 'P002'),
('QUI03', 'Química', 'P003'),
('BIO04', 'Biología', 'P004'),
('HIS05', 'Historia', 'P005'),
('ING06', 'Inglés', 'P006');

INSERT INTO MATRICULA (curso_academico, id_matricula, id_asignatura, pagado)
VALUES
('2022/2023', 'A123456789001', 'MAT01', TRUE),
('2022/2023', 'A123456789002', 'FIS02', FALSE),
('2022/2023', 'A123456789003', 'QUI03', TRUE),
('2023/2024', 'A123456789004', 'BIO04', TRUE),
('2023/2024', 'A123456789005', 'HIS05', FALSE),
('2023/2024', 'A123456789006', 'ING06', TRUE);

SELECT COUNT(*) AS total_alumnos FROM ALUMNO;
SELECT COUNT(*) AS total_alumnos_matriculados_2022 FROM MATRICULA WHERE (curso_academico = "2022/2023" OR curso_academico = "2021/2022")