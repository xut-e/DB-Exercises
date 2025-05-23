-- A) Modificar tabla y trigger existentes

ALTER TABLE log_mecanicos_borrados ADD COLUMN usuario VARCHAR(50) AFTER poblacion;

DELIMITER //

DROP TRIGGER IF EXISTS registrar_borrado_mecanicos:
CREATE TRIGGER registrar_borrado_mecanicos
AFTER DELETE ON mecanicos
FOR EAHC ROW
BEGIN
    INSERT INTO log_mecanicos_borrados (
        dni,
        nombre,
        edad,
        poblacion,
        usuario,
        dia_borrado
    ) VALUES (
        OLD.dni,
        OLD.nombre,
        OLD.edad,
        OLD.poblacion,
        USER(),
        NOW()
    );
END//

DELIMITER ;

-- Eliminar un mecánico
DELETE FROM mecanicos WHERE dni = '11111111A';

-- Ver resultados
SELECT * FROM log_mecanicos_borrados;

-- B) Nueva tabla y trigger para cambios de poblacion

CREATE TABLE IF NOT EXISTS log_cambios_poblacion (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    dni CHAR(9),
    poblacion_antigua VARCHAR(20),
    poblacion_nueva VARCHAR(20),
    dia_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (dni) REFERENCES mecanicos(dni)
);

DELIMITER //

CREATE TRIGGER registrar_actualizacion_mecanico
AFTER UPDATE ON mecanicos
FOR EACH ROW
BEGIN
    IF OLD.poblacion <> NEW.poblacion THEN
        INSERT INTO log_canvis_poblacio (
            dni,
            poblacion_antigua,
            poblacion_nueva
        ) VALUES (
            NEW.dni,
            OLD.poblacion,
            NEW.poblacion
        );
    END IF;
END//

DELIMITER ;

-- Actualizar la población de un mecánico
UPDATE mecanicos SET poblacion = 'Barcelona' WHERE dni = '22222222B';

-- Ver cambios registrados
SELECT * FROM log_cambios_poblacion;