-- A) Función validar_edad_mecanico()
DELIMITER //

CREATE FUNCTION validar_edad_mecanico(edad_validar TINYINT)
RETURN BOOLEAN
DETERMINISTIC
BEGIN
    RETURN edad_validar >= 18;
END //

DELIMITER;

SELECT validar_edad_mecanico(20) AS es_valida; -- Devuelve 1 (true)
SELECT validar_edad_mecanico(16) AS es_valida; -- Devuelve 0 (false)

-- B) Función anyos_de_experiencia()
DELIMITER //

CREATE FUNCTION anyos_de_experiencia(dni_mecanico CHAR(9))
RETURNS TINYINT
READS SQL DATA
BEGIN
    DECLARE edad_actual TINYINT;
    DECLARE anyos_exp TINYINT DEFAULT 0;

    SELECT edad INTO edad_actual FROM mecanicos WHERE dni = dni_mecanico;

    IF edad_actual IS NOT NULL THEN
        SET anyos_exp = GRATEST(edad_actual - 18, 0);
    END IF;

    RETURN anyos_exp;
END //

DELIMITER;


SELECT anyos_de_experiencia('33333333C') AS experiencia; -- Devuelve 10

-- C) Procedimiento anyadir_mecanico_segun_experiencia()
DELIMITER //

CREATE PROCEDURE anyadir_mecanico_segun_experiencia(
    IN p_dni CHAR(9),
    IN p_nombre VARCHAR(50),
    IN p_edad TINYINT,
    IN p_poblacion VARCHAR(50),
    IN p_anyos_de_experiencia_minimos TINYINT
)
BEGIN
    DECLARE edad_valida BOOLEAN;
    DECLARE experiencia_suficiente BOOLEAN;

    SET edad_valida = validar_edad_mecanico(p_edad);

    IF NOT edad_valida THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERROR: La edad debe ser igual o superior a 18 años.';
    END IF

    SET experiencia_suficiente = (p_edad - 18) >= p_anyos_de_experiencia_minimos;

    IF NOT experiencia_suficiente THEN
        SIGNAL SQLSTATE '45001'
        SET MESSAGE_TEXT = 'ERROR: No cumple el mínimo de años de experiencia.';
    END IF;

    INSERT INTO mecanicos(dni, nombre, edad, poblacion) VALUES (p_dni, p_nombre, p_edad, p_poblacion);

    SELECT 'INFO: Mecánico añadido correctamente' AS resultado;
END //

DELIMITER;

-- D) Uso avanzado de SIGNAL para errores
SIGNAL SQLSTATE '45000' -- Es el código de estado personalidado (45000-45999)
SET
    MESSAGE_TEXT = 'Mensaje de error personalizado',
    MYSQL_ERRNO = 1644, --Número de error opcional
    CONSTRAINT_NAME = 'check_edad'; --Nombre de restricción relacionada


CALL anyadir_mecanico_segun_experiencia('87654321B', 'Anna Garcia', 25, 'Barcelona', 5);
-- Devuelve: INFO: Mecánico añadido correctamente

CALL anyadir_mecanico_segun_experiencia('87654321B', 'Anna Garcia', 16, 'Lleida', 1);
-- Devuelve: ERROR: La edad debe ser igual o superior a 18 años.

CALL anyadir_mecanico_segun_experiencia('87654321B', 'Anna Garcia', 20, 'Tarragona', 3);
-- Devuelve: ERROR: No cumple el mínimo de años de experiencia.