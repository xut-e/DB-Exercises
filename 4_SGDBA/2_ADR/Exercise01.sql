-- Creamos la base de datos y las tablas
CREATE DATABASE IF NOT EXISTS supermercado;
USE supermercado;

CREATE TABLE IF NOT EXISTS productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS cesta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente VARCHAR(20) NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

CREATE TABLE IF NOT EXISTS historial_precio_productos (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    precio_antiguo DECIMAL(10,2) NOT NULL,
    precio_nuevo DECIMAL(10,2) NOT NULL,
    dia_actualizacion DATETIME NOT NULL DEFAULT NOW(),
    cliente VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

-- Insertamos algunos datos
INSERT INTO productos (id, nombre, precio) VALUES
(1, 'Leche entera 1L', 1.20),
(2, 'Pan integral', 0.85),
(3, 'Huevos docena', 2.10),
(4, 'Arroz 1kg', 1.50),
(5, 'Aceite de oliva 1L', 4.75),
(6, 'Manzanas 1kg', 1.80),
(7, 'Pechuga de pollo 1kg', 6.90),
(8, 'Yogur natural', 0.45),
(9, 'Café 250g', 3.20),
(10, 'Galletas integrales', 1.15);

-- Insertar datos en la tabla cesta (productos en carrito de clientes)
INSERT INTO cesta (id_cliente, id_producto, cantidad) VALUES
('cliente1', 1, 2),
('cliente1', 3, 1),
('cliente1', 5, 1),
('cliente2', 2, 3),
('cliente2', 6, 2),
('cliente2', 8, 4),
('cliente3', 4, 1),
('cliente3', 7, 1),
('cliente3', 9, 2),
('cliente3', 10, 1);






-- Procedimiento
DELIMITER //

CREATE PROCEDURE actualizar_precio_productos(
    IN escalado DECIMAL(10, 2),
    IN cliente_param VARCHAR(20)
)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE id_producto INT;
    DECLARE precio_actual DECIMAL(10, 2);
    DECLARE precio_nuevo DECIMAL(10, 2);

    -- A) Procedimiento para consultar los productos de un cliente específico
    DECLARE producto_cursor CURSOR FOR
        SELECT productos.id, productos.precio 
        FROM productos 
        JOIN cesta ON productos.id = cesta.id_producto 
        WHERE cesta.id_cliente = cliente_param;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN producto_cursor;

    bucle_actualizacion: LOOP
        FETCH producto_cursor INTO id_producto, precio_actual;
        IF done THEN
            LEAVE bucle_actualizacion;
        END IF;

        -- B) Cálculo de nuevo precio y actualización
        SET precio_nuevo = precio_actual * escalado;
        UPDATE productos SET precio = precio_nuevo WHERE id = id_producto;

        -- C) Insertar registro en el historial
        INSERT INTO historial_precio_productos (
            id_producto,
            precio_antiguo,
            precio_nuevo,
            cliente
        ) VALUES (
            id_producto,
            precio_actual,
            precio_nuevo,
            cliente_param
        );
    END LOOP;

    CLOSE producto_cursor;

    SELECT CONCAT('Actualización completada para cliente ', cliente_param) AS mensaje;
END //

DELIMITER ;
