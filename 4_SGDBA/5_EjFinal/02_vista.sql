CREATE VIEW vista_productos_caros AS
SELECT nombre, precio FROM productos WHERE precio > 100;