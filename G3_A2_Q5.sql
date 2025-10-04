/*Q5} */

SELECT
	c.name AS category_name,
	COUNT(r.rental_id) AS total_rentals
FROM sakila.rental AS r
JOIN sakila.inventory AS i ON r.inventory_id = i.inventory_id
JOIN sakila.film_category AS fc ON i.film_id = fc.film_id
JOIN sakila.category AS c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY total_rentals DESC
LIMIT 10;