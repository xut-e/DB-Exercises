-- Primero modificamos la tabla productos para añadir un campo de stock
ALTER TABLE productos ADD COLUMN IF NOT EXISTS stock INT DEFAULT 10;

DELIMITER //

CREATE PROCEDURE compra_productos_cesta(
    IN nombre_cliente VARCHAR(20)
)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE producto_id INT;
    DECLARE producto_nombre VARCHAR(100);
    DECLARE producto_precio DECIMAL(10,2);
    DECLARE producto_cantidad INT;
    DECLARE cesta_id INT;
    DECLARE coste_acumulado DECIMAL(10,2) DEFAULT 0;
    DECLARE coste_producto DECIMAL(10,2);

    -- A) Cursor para productos en la cesta del cliente
    DECLARE producto_cursor CURSOR FOR
        SELECT cesta.id, productos.id, productos.nombre, productos.precio, cesta.cantidad FROM productos JOIN cesta ON productos.id = cesta.id_producto WHERE cesta.id_cliente = nombre_cliente;
    
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Verificar si el cliente tiene productos
    IF NOT EXISTS (SELECT 1 FROM cesta WHERE id_cliente = nombre_cliente) THEN
        SELECT CONCAT('El cliente ', nombre_cliente, ' no tiene productos en la cesta.') AS mensaje;
        LEAVE;
    END IF;

    OPEN producto_cursor;

    compra_loop: LOOP
        FETCH producto_cursor INTO cesta_id, producto_id, producto_nombre, producto_precio, producto_cantidad;
        
        IF done THEN
            LEAVE compra_loop;
        END IF;

        -- Verificar stock disponible
        IF (SELECT stock FROM productos WHERE id = producto_id) < producto_cantidad THEN
            SELECT CONCAT('No hay suficiente stock para ', producto_nombre, 
                         ' (se necesitan ', producto_cantidad, 
                         ', hay ', (SELECT stock FROM productos WHERE id = producto_id), ').') AS error;
            ITERATE compra_loop;
        END IF;

        -- B) Calcular coste acumulado
        SET coste_producto = producto_precio * producto_cantidad;
        SET coste_acumulado = coste_acumulado + coste_producto;
        
        -- C) Mostrar información del producto y coste acumulado
        SELECT CONCAT('Producto: ', producto_nombre, 
                     ' | Cantidad: ', producto_cantidad, 
                     ' | Precio unitario: ', producto_precio, 
                     ' | Coste producto: ', coste_producto,
                     ' | Coste acumulado: ', coste_acumulado) AS detalle_compra;
        
        -- D) Actualizar stock y eliminar de la cesta
        UPDATE productos 
        SET stock = stock - producto_cantidad 
        WHERE id = producto_id;
        
        DELETE FROM cesta 
        WHERE id = cesta_id;
        
    END LOOP;
    
    CLOSE producto_cursor;
    
    -- E) Mostrar coste total acumulado
    SELECT CONCAT('Compra completada para ', nombre_cliente, '. Coste total: ', coste_acumulado) AS resumen_final;
END //

DELIMITER ;