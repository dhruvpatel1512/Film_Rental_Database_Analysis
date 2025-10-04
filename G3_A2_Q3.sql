/*Q3}Create a query that ranks films within each language by their replacement cost in descending
order. Your result should include the film title, the language, the replacement cost, and the rank
of each film within its language group.*/


SELECT 
    f.title AS FilmTitle,
    l.name AS Language,
    f.replacement_cost AS CostToReplace,
    RANK() OVER (PARTITION BY f.language_id ORDER BY f.replacement_cost DESC) AS RankInLanguage
FROM sakila.film f
JOIN sakila.language l ON f.language_id = l.language_id;