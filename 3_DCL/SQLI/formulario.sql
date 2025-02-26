CREATE DATABASE IF NOT EXISTS formulario;

USE formulario;

CREATE TABLE IF NOT EXISTS usuarios (
	id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(20),
	password VARCHAR(20)
);

INSERT INTO usuarios (username, password) VALUES 
	('pol', 'admin1234'),
	('victor', 'qwerty.123'),
	('antonio','boxboni');
