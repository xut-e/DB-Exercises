USE plantilla_empleados;

-- Borrar todas las localidades sin empleados.
DELETE FROM LOCALIDAD WHERE codigo_localidad NOT IN (SELECT localidad_nacimiento FROM EMPLEADO WHERE localidad_nacimiento IS NOT NULL);

SELECT * FROM LOCALIDAD;

