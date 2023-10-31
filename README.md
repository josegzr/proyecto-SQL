# proyecto-SQL
# Mis primeros pasos

Lo primero que he hecho es crear un jupyter notebook para cada CSV que teníamos y así podía tener todos separados y poder ver uno a uno y no un jupyter con muchas líneas de código y donde nos pasamos la mitad del tiempo subiendo y bajando.

# 1.	Limpieza del csv de actor
En general he buscado nulos, he encontrado que había un actor repetido y lo he quitado para después resetear tanto el índex como el actor id. Para que quede mas limpio junto las columnas first_name y last_name en una nueva columna llamada complete_name y borro las dos columnas de nombres que me sobran. Para terminar separo lo fecha de updated info para poder verla uno a uno (year-mes-dia) y elimino la columna de hora que no me parece que sea nada representativa.

# 2.	Limpieza del csv de categories
En este csv no había mucho que hacer por lo que solo separo lo fecha de updated info para poder verla uno a uno (year-mes-dia) y elimino la columna de hora que no me parece que sea nada representativa.

# 3.	Limpieza del csv de language
Elimino todas las columnas excepto el language_id y name, a name le cambio el nombre para que sea mas representativo y solo deo esas dos columnas porque son las únicas que me sirven en este csv todo lo demás era información que sobraba 

# 4.	Limpieza del csv de film
Lo primero que hago como en todos otros los arreglos la columna last_update y dejo solo el año y el mes. Veo si hay algún nulo. Y subo el CSV de language para poder añairle la columna de language_sp según el language id que tengan como son todos 1 pues en todas las filas nos pone que la película está en inglés. Esto lo hago mediante la herramienta .merg que me coge un dataframe y me junta otro dataframe dependiendo de las columnas que le introduzca yo 



# 5.	Limpieza del csv de OLD_HDD
Subo el archivo de film limpio para poder hacer un .merg para la columna film_id según el titulo que sale en old_hdd. Después de esto busco duplicados, como en actors junto los nombres y subo el csv de actors para hacer un .merg y coger el actor_id según el nombre que salga en old_HDD, por ultimo organizo las columnas para que me quede ordenado

# 6.	Limpieza del csv de rental
En rental lo único que he hecho ha sido separar las fechas de rental y de return de las películas para que se puedan ver mejor 



# 7. estas son las querries que hice para comprobar que las conexiones estaban bien
# seleccionar todo de una tabla
select * from rental;

# seleccionar solo la fila 2 de la tabla film
SELECT film.*
FROM film
where film.film_id = 2;

# seleccione toda la tabla film y donde por el film_id que coincida en old_HDD y film_ID que ponga una nueva columna con el nombre completo del actor
SELECT film.*, actor.complete_name
FROM film
INNER JOIN old_HDD ON film.film_id = old_HDD.film_id
INNER JOIN actor ON old_HDD.actor_id = actor.actor_id;

# para saber cuantas peliculas hay en el inventario del dueño del videoclub, para saber que puede vender
SELECT film.film_id, film.title, COUNT(inventory.film_id) AS cantidad_de_discos_duros
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
GROUP BY film.film_id, film.title;

