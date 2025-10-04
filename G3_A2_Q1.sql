/* Q1} Write a query that calculates the total number of rentals for each film in the Sakila database and
partitions these films into quartiles based on their rental counts. Your result must include the film
title, the total number of rentals, and the quartile number (1, 2, 3, or 4) for each film.
*/

SELECT
f.title AS film_title,
COUNT(r.rental_id) AS total_rentals,
NTILE(4) OVER(ORDER BY COUNT(r.rental_id)DESC) AS quartile
FROM sakila.film AS f
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, film_title;