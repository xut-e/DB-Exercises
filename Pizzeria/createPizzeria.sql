CREATE DATABASE IF NOT EXISTS pizzeria;

USE pizzeria;

CREATE TABLE IF NOT EXISTS CLIENTS (
    dni CHAR(9) PRIMARY KEY,
    client_name VARCHAR(20),
    client_address VARCHAR(25),
    client_phone VARCHAR(9)
);

CREATE TABLE IF NOT EXISTS ORDERS (
    order_id VARCHAR(9) PRIMARY KEY,
    total_price SMALLINT UNSIGNED,
    order_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    order_time TIME,
    order_state ENUM('Pending', 'Preparation', 'Ready/Delivering', 'Served/Delivered', 'Cancelled') NOT NULL DEFAULT 'Pending',
    dni_client CHAR(9),
    FOREIGN KEY (dni_client) REFERENCES CLIENTS(dni) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS PIZZAS (
    pizza_id VARCHAR(9) PRIMARY KEY,
    pizza_name VARCHAR(15),
    base_price TINYINT UNSIGNED
);

CREATE TABLE IF NOT EXISTS MASSES (
    mass_id VARCHAR(9) PRIMARY KEY,
    mass_name VARCHAR(15),
    mass_price TINYINT UNSIGNED
);

CREATE TABLE IF NOT EXISTS INGREDIENT_TYPES (
    ingredient_type_id VARCHAR(9) PRIMARY KEY,
    ingredient_type_name VARCHAR(10),
    ingredient_type_description VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS INGREDIENTS (
    ingredient_id VARCHAR(9) PRIMARY KEY,
    ingredient_name VARCHAR(15),
    ingredient_price TINYINT UNSIGNED,
    ingredient_description VARCHAR(100),
    ingredient_type_id VARCHAR(9),
    FOREIGN KEY (ingredient_type_id) REFERENCES INGREDIENT_TYPES(ingredient_type_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS ALLERGENS (
    allergen_id VARCHAR(9) PRIMARY KEY,
    allergen_name VARCHAR(15),
    allergen_description VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS PIZZAS_MASSES (
    pizza_id VARCHAR(9),
    FOREIGN KEY (pizza_id) REFERENCES PIZZAS(pizza_id) ON DELETE CASCADE ON UPDATE CASCADE,
    mass_id VARCHAR(9),
    FOREIGN KEY (mass_id) REFERENCES MASSES(mass_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS ORDERS_PIZZAS (
    pizza_id VARCHAR(9),
    FOREIGN KEY (pizza_id) REFERENCES PIZZAS(pizza_id) ON DELETE CASCADE ON UPDATE CASCADE,
    order_id VARCHAR(9),
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS INGREDIENTS_ALLERGENS (
    ingredient_id VARCHAR(9),
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENTS(ingredient_id) ON DELETE CASCADE ON UPDATE CASCADE,
    allergen_id VARCHAR(9),
    FOREIGN KEY (allergen_id) REFERENCES ALLERGENS(allergen_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS PIZZAS_INGREDIENTS (
    pizza_id VARCHAR(9),
    FOREIGN KEY (pizza_id) REFERENCES PIZZAS(pizza_id) ON DELETE CASCADE ON UPDATE CASCADE,
    ingredient_id VARCHAR(9),
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENTS(ingredient_id) ON DELETE CASCADE ON UPDATE CASCADE,
    grams_per_ingredient TINYINT UNSIGNED
);

DESCRIBE CLIENTS;
DESCRIBE ORDERS;
DESCRIBE PIZZAS;
DESCRIBE MASSES;
DESCRIBE ALLERGENS;
DESCRIBE INGREDIENTS;
DESCRIBE INGREDIENT_TYPES;
DESCRIBE ORDERS_PIZZAS;
DESCRIBE PIZZAS_MASSES;
DESCRIBE INGREDIENTS_ALLERGENS;
DESCRIBE PIZZAS_INGREDIENTS;