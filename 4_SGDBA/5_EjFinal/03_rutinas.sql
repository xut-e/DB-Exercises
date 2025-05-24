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
);

-- Creamos el procedimiento para actualizar el stock de los productos
DELIMITER //

CREATE PROCEDURE actualizar_stock(
    IN p_cantidad INT,
    IN p_cliente VARCHAR(20)
)
BEGIN
    -- Declaración de variables para el cursor (tenia las mismas puestas y no funcionaba por eso así que las cambié a v_ [variable] y p_ [parametro])
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_id_producto INT;
    DECLARE v_stock_antiguo INT;

    -- Cursor que selecciona todos los productos de la cesta del cliente
    DECLARE cursor_cesta CURSOR FOR
        SELECT id_producto FROM cesta WHERE id_cliente = p_cliente;
   
    -- Le decimos al cursor que pare cuando no haya más productos
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Abrimos el cursor
    OPEN cursor_cesta;

    -- Bucle para recorrer los productos del cliente
    bucle_productos: LOOP
        FETCH cursor_cesta INTO v_id_producto;
        -- Si detectamos que ha terminado de recorrer la cesta salimos del bucle
        IF done THEN
            LEAVE bucle_productos;
        END IF;

        -- Obtenemos el stock antiguo del producto
        SELECT stock INTO v_stock_antiguo FROM productos WHERE id = v_id_producto;

        -- Restamos las unidades que se lleva el cliente
        UPDATE productos SET stock = stock - p_cantidad WHERE id = v_id_producto;

        -- Insertamos el registro en la tabla de historial que hemos creado al principio
        INSERT INTO historial_stock_productos (
            id_producto,
            stock_antiguo,
            stock_nuevo,
            fecha_actualizacion
        ) VALUES (
            v_id_producto,
            v_stock_antiguo,
            v_stock_antiguo - p_cantidad,
            NOW()
        );

    END LOOP;

    -- Cerramos el cursor
    CLOSE cursor_cesta;

    -- Mensaje de confirmación
    SELECT CONCAT('[+] Stock actualizado con éxito para el cliente ', p_cliente) AS mensaje;

END //

DELIMITER ;

-- EJEMPLO DE USO:
-- CALL actualizar_stock(2, 'cliente1');