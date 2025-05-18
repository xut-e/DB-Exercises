USE taller;

-- A) Procedimiento mostrar_mecanicos()
DELIMITER //

CREATE PROCEDURE mostrar_mecanicos()
BEGIN
    SELECT dni, nombre, edad, poblacion FROM mecanicos;
END //

DELIMITER;

CALL mostrar_mecanicos();

-- B) Procedimiento vehiculos_por_marca()
DELIMITER //

CREATE PROCEDURE vehiculos_por_marca(IN marca_param VARCHAR(20))
BEGIN
    SELECT matricula, propietario, marca FROM vehiculos WHERE maraca = marca_param;
END //

DELIMITER ;

CALL vehiculos_por_marca('Ford');

-- C) Procedimiento contar_vehiculos_reparados()
DELIMITER //

CREATE PROCEDURE contar_vehiculos_reparados(OUT total INT)
BEGIN
    SELECT COUNT(*) INTO total FROM vehiculos WHERE reparado_por IS NOT NULL;
END //

DELIMITER ;

CALL contar_vehiculos_reparados(@total_reparados);
SELECT @total_reparados AS 'Total de vehículos reparados';

-- D) Procedimiento anyadir_mecanico_si_no_existe()
DELIMITER //

CREATE PROCEDURE anyadir_mecanico_si_no_existe(
    IN p_dni VARCHAR(9),
    IN p_nombre VARCHAR(50),
    IN p_edad INT,
    IN p_poblacion VARCHAR(50))
BEGIN
    DECLARE existe INT DEFAULT 0;

    SELECT COUNT(*) INTO existe FROM mecanicos WHERE dni = p_dni;
    IF existe == 0 THEN
        INSERT INTO mecanicos(dni, nombre, edad, poblacion) VALUES (p_dni, p_nombre, p_edad, p_poblacion);
        SELECT 'Mecánico añadido correctamente' AS resultado;
    ELSE
        SELECT 'El mecánico ya existe' AS resultado;
    END IF;
END // 

DELIMITER ;

CALL anyadir_mecanico_si_no_existe('66666666F', 'Pau Garcia', 29, 'Barcelona');

-- E) Consulta de metadatos de los procedimientos
SELECT
    routine_name AS procedimiento,
    routine_definition AS definicion,
    created AS fecha_creacion,
    last_altered AS ultima_modificacion
FROM information_schema.routines WHERE routine_schema = 'taller' AND routine_type = 'PROCEDURE' ORDER BY routine_name;
