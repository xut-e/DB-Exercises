-- Definimos la database como la del ej1 de la presentación 2
USE supermercado;

-- Creamos la tabla que se nos pide
CREATE TABLE IF NOT EXISTS historial_stock_productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    stock_antiguo INT,
    stock_nuevo INT,
    fecha_actualizacion DATETIME DEFAULT NOW(),
    FOREIGN KEY (id_producto) REFERENCES productos(id)
)

-- Nos aseguramos de que haya una columna en la tabla productos para el stock
ALTER TABLE productos ADD COLUMN IF NOT EXISTS stock INT NOT NULL DEFAULT 10;

-- Creamos el procedimiento para actualizar el stock de los productos
DELIMITER //

CREATE PROCEDURE actualizar_stock(
    IN cantidad INT,
    IN cliente VARCHAR(20)
)
BEGIN
    -- Declaración de variables para el cursor
    DECLARE done INT DEFAULT FALSE;
    DECLARE id_producto INT;
    DECLARE stock_antiguo INT;

    -- Cursor que selecciona todos los productos de la cesta del cliente
    DECLARE cursor_cesta CURSOR FOR
        SELECT id_producto FROM cesta WHERE id_cliente = cliente;
    
    -- Le decimos al cursor que pare cuando no haya más productos
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Abrimos el cursor
    OPEN cursor_cesta;

    -- Bucle para recorrer los productos del cliente
    bucle_productos: LOOP
        FETCH cursor_cesta INTO id_producto;
        -- Si detectamos que ha terminado de recorrer la cesta salimos del bucle
        IF done THEN
            LEAVE bucle_productos;
        END IF;

        -- Obtenemos el stock antiguo del producto
        SELECT stock INTO stock_antiguo FROM productos where id = id_producto;

        -- Restamos las unidades que se lleva el cliente
        UPDATE productos SET stock = stock - cantidad WHERE id = id_producto;

        -- Insertamos el registro en la tabla de historial que hemos creado al principio
        INSERT INTO historial_stock_productos (
            id_producto,
            stock_antiguo,
            stock_nuevo,
            fecha_actualizacion
        ) VALUES (
            id_producto,
            stock_antiguo,
            stock_antiguo - cantidad,
            NOW()
        );

    END LOOP;

    -- Cerramos el cursor
    CLOSE cursor_cesta;

    -- Mensaje de confirmación
    SELECT CONCAT('[+] Stock actualizado con éxito para el cliente ', cliente) AS mensaje;

END //;

DELIMITER ;

-- EJEMPLO DE USO:
-- CALL actualizar_stock_productos(2, 'cliente1');