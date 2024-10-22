CREATE DATABASE IF NOT EXISTS escuela;

USE escuela;

CREATE TABLE IF NOT EXISTS ALUMNO (
    id_matricula CHAR(15) PRIMARY KEY,
    nombre VARCHAR(20),
    telefono VARCHAR(9),
    dia_nacimiento DATE
);

CREATE TABLE IF NOT EXISTS ASIGNATURA (
    id_asignatura VARCHAR(9),
    nombre VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS MATRICULA (
    curso_academico CHAR(9),
    CONSTRAINT comprobar_curso_academico CHECK (curso_academico REGEXP '^[0-9]{4}/[0-9]{4}$'),
    id_matricula REFERENCES ALUMNO(id_matricula),
    id_asignatura REFERENCES ASIGNATURA(id_asignatura),
    pagado BOOLEAN
);

CREATE TABLE IF NOT EXISTS PROFESOR (
    id_profesor VARCHAR(9) PRIMARY KEY,
    nif_profesor CHAR(9),
    nombre VARCHAR(20),
    telefono VARCHAR(9),
    especialidad VARCHAR(9) REFERENCES ASIGNATURA(id_asignatura)
);

DESCRIBE ALUMNO;
DESCRIBE ASIGNATURA;
DESCRIBE MATRICULA;
DESCRIBE PROFESOR;