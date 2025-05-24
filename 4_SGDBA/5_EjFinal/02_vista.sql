-- Creamos una vista para productos caros (por ejemplo) y después nos aseguramos que se encuentra en el log_file
CREATE VIEW vista_productos_caros AS
SELECT nombre, precio FROM productos WHERE precio > 100;