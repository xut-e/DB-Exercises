CREATE DATABASE IF NOT EXISTS pizzeria;

USE pizzeria;

CREATE TABLE IF NOT EXISTS CLIENT (
    dni CHAR(9) PRIMARY KEY,
    client_name VARCHAR(20),
    client_address VARCHAR(25),
    clieent_phone VARCHAR(9)
);

CREATE TABLE IF NOT EXISTS ORDER (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    total_price SMALLINT UNSIGNED,
    order_date DATE NOT NULL DEFAULT CURRENT_DATE,
    order_state ENUM('Pending', 'Preparation', 'Ready', 'Served/Delivered', 'Cancelled') NOT NULL DEFAULT 'Pending'
);

CREATE TABLE IF NOT EXISTS PIZZA (
    pizza_id INT AUTO_INCREMENT PRIMARY KEY,
    pizza_name VARCHAR(15),
    base_price TINYINT UNSIGNED
);

CREATE TABLE IF NOT EXISTS MASS (
    mass_id INT AUTO_INCREMENT PRIMARY KEY,
    mass_name VARCHAR(10),
    mass_price TINYINT UNSIGNED
);

CREATE TABLE IF NOT EXISTS INGREDIENT (
    ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
    ingredient_name VARCHAR(10),
    ingredient_price TINYINT UNSIGNED,
    ingredient_description VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS ALLERGEN (
    allergen_id INT AUTO_INCREMENT PRIMARY KEY,
    allergen_name VARCHAR(10),
    allergen_description VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS INGREDIENT_TYPE (
    ingredient_type_id INT AUTO_INCREMENT PRIMARY KEY,
    ingredient_type_name VARCHAR(10),
    ingredient_type_description VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS ORDERS_PIZZAS (
    pizza_id INT,
    FOREIGN KEY (pizza_id) REFERENCES PIZZA(pizza_id) ON DELETE CASCADE ON UPDATE CASCADE,
    mass_id INT,
    FOREIGN KEY (mass_id) REFERENCES MASS(mass_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS INGREDIENTS_ALLERGENS (
    ingredient_id INT,
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENT(ingredient_id) ON DELETE CASCADE ON UPDATE CASCADE,
    allergen_id INT,
    FOREIGN KEY (allergen_id) REFERENCES ALLERGEN(allergen_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS PIZZAS_INGREDIENTS (
    pizza_id INT,
    FOREIGN KEY (pizza_id) REFERENCES PIZZA(pizza_id) ON DELETE CASCADE ON UPDATE CASCADE,
    ingredient_id INT,
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENT(ingredient_id) ON DELETE CASCADE ON UPDATE CASCADE,
    grams_per_ingredient TINYINT UNSIGNED,
    CHECK (grams_per_ingredient BETWEEN 10 and 30)
);