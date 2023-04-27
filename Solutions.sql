USE sakila;

-- Query 1
SELECT store_id, city, country  FROM store
	JOIN address ON store.address_id = address.address_id
    JOIN city ON address.city_id = city.city_id
    JOIN country ON country.country_id = city.country_id;
    
-- Query 2    
SELECT store_id, SUM(payment.amount) AS total_business FROM customer
	JOIN payment ON customer.customer_id = payment.customer_id
	GROUP BY customer.store_id;
    
-- Query 3
SELECT category_id, AVG(length) FROM film_category
	JOIN film ON film.film_id = film_category.film_id
    GROUP BY film_category.category_id;
    
-- Query 4
SELECT category_id, SUM(length) FROM film_category
	JOIN film ON film.film_id = film_category.film_id
    GROUP BY film_category.category_id
    ORDER BY SUM(length) DESC;
    
-- Query 5   
SELECT title, COUNT(*) as rental_count FROM film
	JOIN inventory ON inventory.film_id = film.film_id
	JOIN rental ON rental.inventory_id = inventory.inventory_id
	GROUP BY film.film_id
	ORDER BY rental_count DESC;
    
-- Query 6
SELECT `name`, SUM(amount) AS Gross_revenue FROM category
	JOIN film_category ON film_category.category_id = category.category_id
    JOIN film ON film.film_id = film_category.film_id
    JOIN inventory ON inventory.film_id = film.film_id
    JOIN rental ON rental.inventory_id = inventory.inventory_id
    JOIN payment ON payment.rental_id = rental.rental_id
    GROUP BY `name`
    ORDER BY SUM(amount) DESC
    LIMIT 5;
    
-- Query 7
-- I'm sorry to inform you that the store had closed too many years ago, the movie "Academy Dinosaur" is not able anymore.