USE sakila;

-- Does table order in join conditions matter with regards to performance?

SELECT *
FROM film f
INNER JOIN film_actor fa ON f.film_id = fa.film_id
INNER JOIN film_category fc ON f.film_id = fc.film_id 
WHERE f.film_id = 10;

SELECT *
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id 
INNER JOIN film_actor fa ON f.film_id = fa.film_id
WHERE f.film_id = 10;

SELECT *
FROM film_category fc 
INNER JOIN film_actor fa ON fc.film_id = fa.film_id
INNER JOIN film f ON f.film_id = fa.film_id 
WHERE f.film_id = 10;

-- Explain 
EXPLAIN EXTENDED SELECT *
FROM film f
INNER JOIN film_actor fa ON f.film_id = fa.film_id
INNER JOIN film_category fc ON f.film_id = fc.film_id 
WHERE f.film_id = 10;
SHOW STATUS LIKE 'Last_Query_Cost';


EXPLAIN EXTENDED SELECT *
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id 
INNER JOIN film_actor fa ON f.film_id = fa.film_id
WHERE f.film_id = 10;
SHOW STATUS LIKE 'Last_Query_Cost';

EXPLAIN EXTENDED SELECT *
FROM film_category fc 
INNER JOIN film_actor fa ON fc.film_id = fa.film_id
INNER JOIN film f ON f.film_id = fa.film_id 
WHERE f.film_id = 10;
SHOW STATUS LIKE 'Last_Query_Cost';
