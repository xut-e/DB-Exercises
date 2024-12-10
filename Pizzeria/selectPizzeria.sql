USE pizzeria;

-- 1. Listar el nombre, direccion y telefono de todos los clientes.

SELECT client_name, client_address, client_phone FROM CLIENTS;

-- 2. Listar todas las pizzas que tienen un precio base superior a 10 euros.

SELECT pizza_name FROM PIZZAS WHERE base_price > 10;

-- 3. Mostrar la pizza con el precio base mas caro.

SELECT pizza_name FROM PIZZAS WHERE base_price = (SELECT MAX(base_price) FROM PIZZAS);

-- 4. Listar las tres masas mas caras ordenadas por precio, de la mas cara a la mas barata.

SELECT mass_name, mass_price FROM MASSES ORDER BY mass_price DESC;

-- 5. Listar cuantos pedidos ha hecho cada cliente.

SELECT CLIENTS.client_name, COUNT(ORDERS.order_id) FROM CLIENTS LEFT JOIN ORDERS ON CLIENTS.dni = ORDERS.dni_client GROUP BY CLIENTS.dni;

-- 6. Listar todos los pedidos realizados antes de mediodia.

SELECT order_id AS pedidos_antes_mediodia FROM ORDERS WHERE order_time < '12:00:00';

-- 7. Listar los ingredientes que contienen alergenos, mostrando solamente el nombre del ingrediente con el alias ingredientes con alergenos.

SELECT DISTINCT INGREDIENTS.ingredient_name AS ingredientes_con_alergenos FROM INGREDIENTS INNER JOIN INGREDIENTS_ALLERGENS ON INGREDIENTS.ingredient_id = INGREDIENTS_ALLERGENS.ingredient_id WHERE INGREDIENTS_ALLERGENS.allergen_id IS NOT NULL;

-- 8. Muestra la media de precio por ingrediente.

SELECT AVG(ingredient_price) AS media_precio_ingrediente FROM INGREDIENTS;