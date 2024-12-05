USE plantilla_empleados;

SELECT COUNT(*) AS total_regiones FROM REGION;
SELECT nombre FROM REGION WHERE nombre LIKE 'B%';
SELECT MAX(salario_anual) AS mayor_salario FROM EMPLEADO;
SELECT nombre, telefono FROM EMPLEADO WHERE salario_anual < 20000;
SELECT EMPLEADO.nombre AS nombre_barcelonis, EMPLEADO.salario_anual AS salario_barcelonis FROM EMPLEADO INNER JOIN LOCALIDAD WHERE (EMPLEADO.localidad_nacimiento = LOCALIDAD.codigo_localidad AND LOCALIDAD.codigo_localidad = '201');
SELECT AVG(salario_anual) AS salario_medio FROM EMPLEADO WHERE localidad_nacimiento = (SELECT codigo_localidad FROM LOCALIDAD WHERE nombre = 'Barcelona');
-- Aqui lo he hecho con las Comunidades del noroeste porque no tengo una region que sea comunidad valenciana:
SELECT PROVINCIA.nombre AS provincias_noroeste FROM PROVINCIA INNER JOIN REGION WHERE (REGION.codigo_region = PROVINCIA.codigo_region AND REGION.codigo_region = '01');
SELECT codigo_localidad, nombre AS localidad_sin_empleados FROM LOCALIDAD WHERE codigo_localidad NOT IN (SELECT DISTINCT localidad_nacimiento FROM EMPLEADO);
SELECT REGION.nombre, REGION.codigo_region FROM REGION INNER JOIN PROVINCIA ON REGION.codigo_region = PROVINCIA.codigo_region GROUP BY REGION.codigo_region, REGION.nombre HAVING COUNT(PROVINCIA.codigo_provincia) > 1;
SELECT LOCALIDAD.nombre AS nombre_localidad, COUNT(EMPLEADO.id_empleado) AS total_empleados FROM LOCALIDAD LEFT JOIN EMPLEADO ON LOCALIDAD.codigo_localidad = EMPLEADO.localidad_nacimiento GROUP BY LOCALIDAD.nombre;
-- Lo mismo que en la anterior vez que comenté
SELECT EMPLEADO.nombre AS nombre_empleado_noroeste FROM EMPLEADO INNER JOIN LOCALIDAD ON EMPLEADO.localidad_nacimiento = LOCALIDAD.codigo_localidad INNER JOIN PROVINCIA ON LOCALIDAD.codigo_provincia = PROVINCIA.codigo_provincia INNER JOIN REGION ON PROVINCIA.codigo_region = REGION.codigo_region WHERE REGION.nombre = 'Noroeste'; 