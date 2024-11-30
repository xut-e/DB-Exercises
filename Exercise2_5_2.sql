USE plantilla_empleados;

-- Borrar todas las localidades sin empleados.
DELETE FROM LOCALIDAD WHERE codigo_localidad NOT IN (SELECT localidad_nacimiento FROM EMPLEADO WHERE localidad_nacimiento IS NOT NULL);

SELECT * FROM LOCALIDAD;

-- Borrar todos los empleados con sueldo superios o 70000.
DELETE FROM EMPLEADO WHERE salario_anual > 70000;

SELECT * FROM EMPLEADO;

-- Establecer a 50000 el sueldo de los empleados nacidos en Barcelona.
UPDATE EMPLEADO SET salario_anual = 50000 WHERE localidad_nacimiento = (SELECT codigo_localidad FROM LOCALIDAD WHERE nombre = 'Barcelona');

SELECT * FROM EMPLEADO;

-- Incrementar un 20% el salario de los empleados con un sueldo inferior a 20000.
UPDATE EMPLEADO SET salario_anual = salario_anual * 1.20 WHERE salario_anual < 20000;

SELECT * FROM EMPLEADO;