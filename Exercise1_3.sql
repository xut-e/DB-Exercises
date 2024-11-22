CREATE TABLE IF NOT EXISTS ALUMNO (
    id_matricula CHAR(15) PRIMARY KEY,
    nombre VARCHAR(20),
    telefono VARCHAR(9),
    dia_nacimiento DATE
);

CREATE TABLE IF NOT EXISTS PROFESOR (
    id_profesor VARCHAR(3) PRIMARY KEY,
    nif_profesor CHAR(9),
    nombre VARCHAR(20),
    telefono VARCHAR(9)
);

CREATE TABLE IF NOT EXISTS ASIGNATURA (
    id_asignatura VARCHAR(4) PRIMARY KEY,
    nombre VARCHAR(20),
    codigo_profesor VARCHAR(20),
    FOREIGN KEY (codigo_profesor) REFERENCES PROFESOR(id_profesor) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS MATRICULA (
    curso_academico CHAR(9),
    CONSTRAINT comprobar_curso_academico CHECK (curso_academico REGEXP '^[0-9]{4}/[0-9]{4}$'),
    id_matricula CHAR(15),
    FOREIGN KEY (id_matricula) REFERENCES ALUMNO(id_matricula) ON DELETE SET NULL ON UPDATE CASCADE,
    id_asignatura VARCHAR(4),
    FOREIGN KEY (id_asignatura) REFERENCES ASIGNATURA(id_asignatura) ON DELETE SET NULL ON UPDATE CASCADE,
    pagado BOOLEAN
);

DESCRIBE ALUMNO;
DESCRIBE ASIGNATURA;
DESCRIBE MATRICULA;
DESCRIBE PROFESOR;