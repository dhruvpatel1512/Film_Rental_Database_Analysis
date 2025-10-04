SELECT 
	film_id,
    title,
    release_year,
    language_id,
    rating,
    special_features,
    rental_duration,
    CASE
		WHEN rental_rate >= 4.00 AND replacement_cost >=20.00 THEN 1
        ELSE 0
	END AS high_value_content
FROM  sakila.film
ORDER BY high_value_content DESC;
    
    
    