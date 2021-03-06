-- 1. Crear base de datos llamada películas.
CREATE DATABASE peliculas_db;
\c peliculas_db;

-- 1.5. Crear las tablas
CREATE TABLE peliculas (id INT PRIMARY KEY, titulo_pelicula VARCHAR(125), year_estreno INT, director VARCHAR(125));
CREATE TABLE reparto (pelicula_fk INT, actor VARCHAR(125), FOREIGN KEY (pelicula_fk) REFERENCES peliculas(id));

-- 2. Cargar ambos archivos a su tabla correspondiente.
\copy peliculas FROM 'C:\Users\glauc\Documents\Programacion 2020\SENCEClases5\4/peliculas.csv' csv header;
\copy reparto FROM 'C:\Users\glauc\Documents\Programacion 2020\SENCEClases5\4/reparto.csv' csv;

-- 3. Obtener el ID de la película “Titanic”.
SELECT id AS titanic_id FROM peliculas WHERE titulo_pelicula = 'Titanic';

-- 4. Listar a todos los actores que aparecen en la película "Titanic".
SELECT actor AS actores_titanic FROM reparto WHERE pelicula_fk = 2; -- NOTA: El "AS actores_titanic" deberia ser "AS actores_peliculas" para que se pueda reutilizar

-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT COUNT(pelicula_fk) AS cantidad_peliculas_harrison FROM reparto WHERE actor = 'Harrison Ford'; -- NOTA: Lo mismo que la nota del punto 4.

-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de
-- manera ascendente.
SELECT titulo_pelicula, year_estreno FROM peliculas WHERE year_estreno BETWEEN 1990 AND 1999 ORDER BY titulo_pelicula ASC;

-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser
-- nombrado para la consulta como “longitud_titulo”.
SELECT titulo_pelicula, LENGTH(titulo_pelicula) AS longitud_titulo FROM peliculas ORDER BY LENGTH(titulo_pelicula) ASC;

-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT MAX(LENGTH(titulo_pelicula)) FROM peliculas;
