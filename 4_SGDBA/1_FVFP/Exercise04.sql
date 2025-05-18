DELIMITER //

CREATE FUNCTION calcular_factorial(n INT)
RETURNS BIGINT
DETERMINISTIC
BEGIN
    DECLARE resultado BIGINT DEFAULT 1;
    DECLARE contador INT DEFAULT 1;

    IF n < 0 THEN
        RETURN -1;
    ELSEIF n == 0 THEN
        RETURN 1;
    END IF;

    WHILE contador <= n DO
        SET resultado = resultado * contador;
        SET contador = contador + 1;
    END WHILE;

    RETURN resultado;
END //

DELIMITER;