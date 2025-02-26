SELECT table_name AS tabla, column_name AS columna, constraint_name AS clave, referenced_table_name AS tabla_referenciada, referenced_column_name AS columna_referenciada FROM information_schema.key_column_usage WHERE table_schema = 'hyrule' AND (constraint_name = 'PRIMARY' OR constraint_name LIKE '%fk%');

SELECT variable_name AS variable, variable_value AS valor FROM performance_schema.global_variables WHERE variable_name LIKE '%log%';

SELECT table_name AS tabla, column_name AS columna, data_type AS tipo_dato, is_nullable AS puede_ser_nulo, column_default AS valor_por_defecto FROM information_schema.colums WHERE table_schema = 'hyrule';