USE pizzeria;

-- Inserciones para CLIENTS
INSERT INTO CLIENTS (dni, client_name, client_address, client_phone) VALUES
('11111111A', 'Juan Perez', 'Calle Falsa 123', '600111111'),
('22222222B', 'Ana Gomez', 'Avenida Siempreviva 742', '600222222'),
('33333333C', 'Luis Martinez', 'Plaza Mayor 10', '600333333'),
('44444444D', 'Maria Lopez', 'Calle Luna 34', '600444444'),
('55555555E', 'Pedro Sanchez', 'Calle Sol 56', '600555555'),
('66666666F', 'Clara Fernandez', 'Paseo Marítimo 78', '600666666'),
('77777777G', 'Jorge Ruiz', 'Calle Victoria 90', '600777777'),
('88888888H', 'Sofia Torres', 'Calle Colón 12', '600888888'),
('99999999I', 'Lucia Ramirez', 'Calle Libertad 34', '600999999'),
('10101010J', 'Carlos Ortega', 'Calle Triunfo 56', '601010101');

-- Inserciones para ORDERS
-- Cálculo: Precio Total = Precio Base Pizza + Precio Masa + Precio Ingredientes * Número Ingredientes * Número Pizzas
INSERT INTO ORDERS (total_price, order_date, order_time, order_state, dni_client) VALUES
(40, '2023-12-01', '12:30:00', 'Served/Delivered', '11111111A'),  -- Margarita + Pepperoni (2 pizzas)
(14, '2023-12-01', '11:15:00', 'Cancelled', '22222222B'),         -- Cuatro Quesos (1 pizza)
(56, '2023-12-01', '13:00:00', 'Served/Delivered', '33333333C'),  -- Vegetal + Hawaiana (2 pizzas)
(20, '2023-12-01', '12:45:00', 'Served/Delivered', '44444444D'),  -- Barbacoa (1 pizza)
(52, '2023-12-02', '10:00:00', 'Cancelled', '55555555E'),        -- Mexicana + Carbonara + Caprichosa (3 pizzas)
(14, '2023-12-02', '13:30:00', 'Served/Delivered', '66666666F'),  -- Diávola (1 pizza)
(56, '2023-12-02', '09:30:00', 'Ready/Delivering', '77777777G'),           -- Margarita + Barbacoa (2 pizzas)
(72, '2023-12-02', '10:45:00', 'Preparation', '88888888H'),       -- Pepperoni + Cuatro Quesos + Vegetal (3 pizzas)
(20, '2023-12-02', '11:15:00', 'Preparation', '99999999I'),  -- Hawaiana (1 pizza)
(104, '2023-12-02', '09:00:00', 'Pending', '10101010J'),          -- Diávola + Barbacoa + Caprichosa (3 pizzas)
(20, '2023-12-02', '12:00:00', 'Pending', '11111111A');  -- Hawaiana (1 pizza)


-- Inserciones para PIZZAS
INSERT INTO PIZZAS (pizza_name, base_price) VALUES
('Margarita', 8),
('Pepperoni', 12),
('Cuatro Quesos', 14),
('Vegetal', 11),
('Hawaiana', 13),
('Barbacoa', 15),
('Mexicana', 10),
('Carbonara', 9),
('Diávola', 14),
('Caprichosa', 13);

-- Inserciones para MASSES
INSERT INTO MASSES (mass_name, mass_price) VALUES
('Fina', 2),
('Gruesa', 3),
('Integral', 3),
('Sin Gluten', 4),
('Clásica', 2),
('Esponjosa', 3),
('Corteza Rellena', 5),
('Al Ajillo', 4),
('De Hierbas', 3),
('Tradicional', 2);

-- Inserciones para INGREDIENTS_TYPES
INSERT INTO INGREDIENT_TYPES (ingredient_type_name, ingredient_type_description) VALUES
('Cárnico', 'Ingredientes derivados de carne.'),
('Vegetal', 'Ingredientes de origen vegetal.'),
('Lácteo', 'Ingredientes basados en leche o derivados.'),
('Salsa', 'Salsas y bases líquidas.'),
('Fruta', 'Ingredientes dulces de fruta.'),
('Picante', 'Ingredientes con sabores picantes.'),
('Herbáceo', 'Hierbas y condimentos.'),
('Marino', 'Ingredientes del mar.'),
('Queso', 'Variedades de queso.'),
('Especial', 'Ingredientes poco comunes.');

-- Inserciones para INGREDIENTS
-- El ingrediente de pimientos esta puesto solo para comprobar que el comando que sube el precio un 20% funcionaba correctamente (al ser un tinyint unsigned el tipo de numero, si es muy peuqueño multiplicarlo por 1.2 es como no multiplicarlo por nada, por eso le puse precio 10).
INSERT INTO INGREDIENTS (ingredient_name, ingredient_price, ingredient_description, ingredient_type_id) VALUES
('Pepperoni', 2, 'Rodajas de pepperoni.', 1),
('Tomate', 1, 'Salsa de tomate.', 4),
('Mozzarella', 3, 'Queso mozzarella.', 9),
('Jamón', 2, 'Jamón cocido.', 1),
('Piña', 2, 'Trozos de piña.', 5),
('Aceitunas', 1, 'Aceitunas verdes.', 2),
('Champiñones', 1, 'Champiñones frescos.', 2),
('Cebolla', 1, 'Cebolla caramelizada.', 2),
('Carne Picada', 3, 'Carne molida.', 1),
('Jalapeños', 2, 'Rodajas de jalapeños.', 6),
('Pimientos', 10, 'Pimientos nacionales', 2);;

-- Inserciones para ALLERGENS
INSERT INTO ALLERGENS (allergen_name, allergen_description) VALUES
('Gluten', 'Presente en harinas.'),
('Lácteos', 'Presente en quesos.'),
('Marisco', 'Presente en ingredientes del mar.'),
('Frutos Secos', 'Presente en ciertas salsas.'),
('Soja', 'Ingrediente en salsas.'),
('Huevo', 'Presente en ciertas masas.'),
('Mostaza', 'Ingrediente en salsas.'),
('Pescado', 'Presente en ciertos toppings.'),
('Sésamo', 'Usado en la corteza.'),
('Apio', 'Presente en salsas.');

-- Inserciones para PIZZAS_MASSES
INSERT INTO PIZZAS_MASSES (pizza_id, mass_id) VALUES
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5), 
(6, 6), 
(7, 7), 
(8, 8), 
(9, 9), 
(10, 10);

-- Inserciones para ORDERS_PIZZAS
INSERT INTO ORDERS_PIZZAS (pizza_id, order_id) VALUES
(1, 1), 
(2, 1), 
(3, 2), 
(4, 3), 
(5, 3), 
(6, 4), 
(7, 5), 
(8, 5), 
(10, 5), 
(9, 6), 
(1, 7), 
(6, 7), 
(2, 8), 
(3, 8), 
(4, 8), 
(5, 9), 
(9, 10), 
(6, 10), 
(10, 10);

-- Inserciones para INGREDIENTS_ALLERGENS
INSERT INTO INGREDIENTS_ALLERGENS (ingredient_id, allergen_id) VALUES
(1, 1), -- Pepperoni contiene Gluten (si viene en masa o aditivo).
(2, 1), -- Tomate podría tener Gluten (si es en salsa procesada).
(3, 2), -- Mozzarella contiene Lácteos.
(4, 1), -- Jamón puede contener Gluten (aditivos).
(5, 5), -- Piña podría tener Soja (envasada con conservantes).
(6, 7), -- Aceitunas pueden contener Mostaza (en conservantes).
(7, NULL), -- Champiñones no tienen alérgenos comunes.
(8, NULL), -- Cebolla no tiene alérgenos comunes.
(9, 1), -- Carne Picada podría contener Gluten (aditivos o aglutinantes).
(10, 6), -- Jalapeños pueden contener Huevo (en conservantes procesados).
(11, NULL); -- Pimientos no tienen alérgenos comunes.

-- Inserciones para PIZZAS_INGREDIENTS
INSERT INTO PIZZAS_INGREDIENTS (pizza_id, ingredient_id, grams_per_ingredient) VALUES
(1, 2, 15), 
(1, 3, 20), 
(2, 1, 25), 
(2, 3, 15), 
(3, 3, 20), 
(3, 7, 15), 
(4, 7, 15), 
(4, 8, 20), 
(5, 4, 20), 
(5, 5, 15), 
(6, 9, 20), 
(6, 2, 15), 
(7, 10, 15), 
(7, 2, 15), 
(8, 8, 15), 
(8, 3, 20), 
(9, 3, 20), 
(9, 10, 15), 
(10, 6, 15), 
(10, 7, 20);


-- Vemos que los datos hayan sido insertados correctamente.

SELECT * FROM CLIENTS;
SELECT * FROM ORDERS;
SELECT * FROM PIZZAS;
SELECT * FROM MASSES;
SELECT * FROM ALLERGENS;
SELECT * FROM INGREDIENTS;
SELECT * FROM INGREDIENT_TYPES;
SELECT * FROM ORDERS_PIZZAS;
SELECT * FROM PIZZAS_MASSES;
SELECT * FROM INGREDIENTS_ALLERGENS;
SELECT * FROM PIZZAS_INGREDIENTS;
