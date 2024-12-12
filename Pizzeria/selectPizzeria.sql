USE pizzeria;

-- 1. Listar el nombre, direccion y telefono de todos los clientes.

SELECT client_name, client_address, client_phone FROM CLIENTS;

-- 2. Listar todas las pizzas que tienen un precio base superior a 10 euros.

SELECT pizza_name FROM PIZZAS WHERE base_price > 10;

-- 3. Mostrar la pizza con el precio base mas caro.

SELECT pizza_name FROM PIZZAS WHERE base_price = (SELECT MAX(base_price) FROM PIZZAS);

-- 4. Listar las tres masas mas caras ordenadas por precio, de la mas cara a la mas barata.

SELECT mass_name, mass_price FROM MASSES ORDER BY mass_price DESC LIMIT 3;

-- 5. Listar cuantos pedidos ha hecho cada cliente.

SELECT CLIENTS.client_name, COUNT(ORDERS.order_id) FROM CLIENTS LEFT JOIN ORDERS ON CLIENTS.dni = ORDERS.dni_client GROUP BY CLIENTS.dni;

-- 6. Listar todos los pedidos realizados antes de mediodia.

SELECT order_id AS pedidos_antes_mediodia FROM ORDERS WHERE order_time < '12:00:00';

-- 7. Listar los ingredientes que contienen alergenos, mostrando solamente el nombre del ingrediente con el alias ingredientes con alergenos.

SELECT DISTINCT INGREDIENTS.ingredient_name AS ingredientes_con_alergenos FROM INGREDIENTS INNER JOIN INGREDIENTS_ALLERGENS ON INGREDIENTS.ingredient_id = INGREDIENTS_ALLERGENS.ingredient_id WHERE INGREDIENTS_ALLERGENS.allergen_id IS NOT NULL;

-- 8. Muestra la media de precio por ingrediente.

SELECT AVG(ingredient_price) AS media_precio_ingrediente FROM INGREDIENTS;

-- 9. Muestra el total de gramos de ingredientes que contiene cada pizza.

SELECT PIZZAS.pizza_name AS nombre_pizza, SUM(PIZZAS_INGREDIENTS.grams_per_ingredient) AS total_gramos FROM PIZZAS INNER JOIN PIZZAS_INGREDIENTS ON PIZZAS.pizza_id = PIZZAS_INGREDIENTS.pizza_id GROUP BY PIZZAS.pizza_id, PIZZAS.pizza_name;

-- 10. Lista el numero total de pedidos por cliente, mostrando el nombre del cliente y el total de pedidos realizados.

SELECT CLIENTS.client_name AS nombre_cliente, COUNT(ORDERS.order_id) AS total_pedidos FROM ORDERS LEFT JOIN CLIENTS ON CLIENTS.dni = ORDERS.dni_client GROUP BY CLIENTS.client_name, ORDERS.dni_client;

-- 11. Listar las pizzas que tienen mas de tres ingredientes mostrando el nombre de la pizza y el numero de ingredientes.

SELECT PIZZAS.pizza_name AS nombre_pizza, COUNT(PIZZAS_INGREDIENTS.ingredient_id) AS total_ingredientes FROM PIZZAS LEFT JOIN PIZZAS_INGREDIENTS ON PIZZAS.pizza_id = PIZZAS_INGREDIENTS.pizza_id GROUP BY PIZZAS.pizza_id, PIZZAS.pizza_name HAVING COUNT(PIZZAS_INGREDIENTS.ingredient_id) > 3;

-- 12. Extrae la facturacion que ha tenido un cliente especifico en toda su vida, indicando la base imponible, el IVA y el total facturado.

SELECT CLIENTS.dni AS id_cliente, CLIENTS.client_name AS nombre_cliente, SUM(ORDERS.total_price / 1.21) AS base_imponible, SUM(ORDERS.total_price - (ORDERS.total_price / 1.21)) AS IVA, SUM(ORDERS.total_price) AS total_facturado FROM CLIENTS INNER JOIN ORDERS ON CLIENTS.dni = ORDERS.dni_client WHERE CLIENTS.dni = '55555555E' GROUP BY CLIENTS.dni, CLIENTS.client_name; -- Donde pone 55555555E sustituir por el cliente deseado.