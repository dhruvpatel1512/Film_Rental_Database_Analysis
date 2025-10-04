 /*Q2} For each film category, write a query to identify the films with rental rates that exceed the
average rental rate for that category. The output should display the film category name, film title,
the film’s rental rate, and the average rental rate computed for the category.*/
 
SELECT
category_name,
film_title,
film_rentel_rate,
average_rentalrate
FROM (
	SELECT
	c.name AS category_name,
	f.title AS film_title,
	f.rental_rate AS film_rentel_rate,
	AVG(f.rental_rate) OVER (PARTITION BY c.category_id) AS average_rentalrate
	FROM sakila.category AS c
	JOIN film_category AS fc ON c.category_id = fc.category_id
	JOIN film AS f ON fc.film_id = f.film_id
) AS compare_avg
WHERE film_rentel_rate > average_rentalrate
ORDER BY category_name, film_rentel_rate DESC;