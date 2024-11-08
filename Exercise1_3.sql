CREATE DATABASE IF NOT EXISTS escuela;

USE escuela;

CREATE TABLE IF NOT EXISTS ALUMNO (
    id_matricula CHAR(15) PRIMARY KEY,
    nombre VARCHAR(20),
    telefono VARCHAR(9),
    dia_nacimiento DATE
);

CREATE TABLE IF NOT EXISTS ASIGNATURA (
    id_asignatura VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS MATRICULA (
    curso_academico CHAR(9),
    CONSTRAINT comprobar_curso_academico CHECK (curso_academico REGEXP '^[0-9]{4}/[0-9]{4}$'),
    id_matricula CHAR(15),
    FOREIGN KEY (id_matricula) REFERENCES ALUMNO(id_matricula) ON DELETE SET NULL ON UPDATE CASCADE,
    id_asignatura VARCHAR(20),
    FOREIGN KEY (id_asignatura) REFERENCES ASIGNATURA(id_asignatura) ON DELETE SET NULL ON UPDATE CASCADE,
    pagado BOOLEAN
);

CREATE TABLE IF NOT EXISTS PROFESOR (
    id_profesor VARCHAR(9) PRIMARY KEY,
    nif_profesor CHAR(9),
    nombre VARCHAR(20),
    telefono VARCHAR(9),
    especialidad VARCHAR(9),
    FOREIGN KEY (especialidad) REFERENCES ASIGNATURA(id_asignatura) ON DELETE SET NULL ON UPDATE CASCADE
);

DESCRIBE ALUMNO;
DESCRIBE ASIGNATURA;
DESCRIBE MATRICULA;
DESCRIBE PROFESOR;