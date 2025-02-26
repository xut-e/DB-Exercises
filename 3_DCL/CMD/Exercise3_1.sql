SELECT user.User AS usuario, tables_priv.Table_name AS tabla, tables_priv.Table_priv AS privilegios FROM mysql.user JOIN mysql.tables_priv ON user.User = tables_priv.User WHERE tables_priv.Db = 'hyrule';

SELECT table_name AS tabla FROM information_schema.tables WHERE table__schema = 'hyrule';

SELECT table_name AS tabla, table_rows AS filas FROM information_schema.tables WHERE table_schema = 'hyrule';

SELECT column_name AS columna, data_type AS tipo_dato is_nullable AS puede_ser_nulo, column_default AS valor_por_defecto FROM information_schema.columns WHERE information_schema = 'hyrule' AND table_name = 'armas';