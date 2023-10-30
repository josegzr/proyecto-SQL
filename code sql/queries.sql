# seleccionar todo de una tabla
select * from rental;

# seleccionar solo la fila 2 de la tabla film
SELECT film.*
FROM film
where film.film_id = 2;

#que seleccione toda la tabla film y donde por el film_id que coincida en old_HDD y film_ID que ponga una nueva columna con el nombre completo del actor
SELECT film.*, actor.complete_name
FROM film
INNER JOIN old_HDD ON film.film_id = old_HDD.film_id
INNER JOIN actor ON old_HDD.actor_id = actor.actor_id;

# para saber cuantas peliculas hay en el inventario del dueño del videoclub, para saber que puede vender
SELECT film.film_id, film.title, COUNT(inventory.film_id) AS cantidad_de_discos_duros
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
GROUP BY film.film_id, film.title;







