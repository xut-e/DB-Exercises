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
    
)