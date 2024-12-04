USE zoologico;

-- Incrementar en un 10% el presupuesto del zoológico con animales femeninos del continente africano.
UPDATE ZOO SET presupuesto = presupuesto * 1.10 WHERE id_zoo IN (SELECT zoo_pertenece FROM ANIMAL WHERE sexo = FALSE AND continente = 'África');

-- Eliminar unopp de los zoológicos y comprobar si se han eliminado los animales asociados.
DELETE FROM ZOO WHERE id_zoo = 'Z00002';

SELECT * FROM ZOO;
SELECT * FROM ANIMAL;

-- No se han borrado los datos del animal poorque tengo la condición en las tablas de 'ON DELETE SET NULL' en vez de 'ON DELETE CASCADE'.

-- Borrar una especie de la base de datos y comprobar si los animales asociados se borran también.
DELETE FROM ESPECIE WHERE id_especie = '5';

SELECT * FROM ESPECIE;
SELECT * FROM ANIMAL;

-- Pasa exactamente lo mismo que en el ejercicio anterior. Si quisisera que se borraran de la base de datos bastaría cambiar 'ON DELETE SET NULL' por 'ON DELETE CASCADE'.
