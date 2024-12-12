USE pizzeria;

-- Hacemos las acciones requeridas.

DELETE FROM ALLERGENS WHERE allergen_id NOT IN (SELECT DISTINCT allergen_id FROM INGREDIENTS_ALLERGENS);
SELECT * FROM ALLERGENS;

UPDATE INGREDIENTS SET ingredient_price = ingredient_price * 1.20 WHERE ingredient_id NOT IN (SELECT DISTINCT ingredient_id FROM PIZZAS_INGREDIENTS);
SELECT * FROM INGREDIENTS;


-- Existe un problema en el siguiente ejercicio y es que no nos deja hacer una subconsulta de la misma tabla que se esta modificando (restricciones de procesamiento interno).
-- Es por eso que la sentencia:
--  DELETE FROM ORDERS WHERE total_price = (SELECT MIN(total_price) FROM ORDERS);
-- No funciona. Se puede resolver de un par de maneras, yo he optado por la que me parece mas sencilla: declarar una variable que almacene el resultado de la subconsulta y despues eliminar los datos de la tabla.

SET @min_price = (SELECT MIN(total_price) FROM ORDERS);

DELETE FROM ORDERS
WHERE total_price = @min_price;

SELECT * FROM ORDERS;