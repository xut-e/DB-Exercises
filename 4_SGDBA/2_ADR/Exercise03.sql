-- A) Trigger para borrar mecánico

DELIMITER //

CREATE TRIGGER comprobar_borrar_mecanico
BEFORE DELETE ON mecanicos
FOR EACH ROW
BEGIN

    IF (SELECT COUNT(*) FROM vehiculos WHERE reparado_por = OLD.dni) > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERROR: No se puede eliminar al mecánico, tiene vehículos asociados.';
    END IF;
END//

DELIMITER ;

-- B) Tabla de logs + trigger

-- Creamos la tabla si no existe
CREATE TABLE IF NOT EXISTS log_mecanicos_borrados (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    dni CHAR(9),
    nombre VARCHAR(50),
    edad TINYINT UNSIGNED,
    poblacion VARCHAR(20),
    dia_borrado DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Creamos el trigger

DELIMITER //

CREATE TRIGGER registrar_borrado_mecanicos
AFTER DELETE ON mecanicos
FOR EACH ROW
BEGIN

    INSERT INTO log_mecanicos_borrados (dni, nombre, edad, poblacion) VALUES (OLD.dni, OLD.nombre, OLD.edad, OLD.poblacion);
    SELECT CONCAT('Registro de eliminación actualizado para ', OLD.nombre) AS mensaje;
END//

DELIMITER ;


-- Eliminar un mecánico
DELETE FROM mecanicos WHERE dni = '12345678A';

-- Ver registros de la tabla
SELECT * FROM log_mecanicos_borrados;
