/*Q4} Develop a query to compute the interval, in days, between consecutive rentals for each customer
in the Sakila database. */

SELECT 
		rental_id,
		customer_id,
		rental_date,
DATEDIFF(
		LEAD(r.rental_date) OVER (PARTITION BY r.customer_id ORDER BY r.rental_date),
		r.rental_date
 ) AS days_until_next_rental
FROM sakila.rental AS r
ORDER BY customer_id asc, rental_date asc; 	