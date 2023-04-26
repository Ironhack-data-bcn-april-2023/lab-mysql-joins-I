USE sakila;
SELECT * FROM store;



--  Query #1
	-- Display for each store its store ID, city, and country.
SELECT store_id, city, country  
	FROM store
		JOIN address ON store.address_id = address.address_id
		JOIN city ON address.city_id = city.city_id
		JOIN country ON country.country_id = city.country_id;
        
-- Query #2
	-- Display how much business, in dollars, each store brought in.

SELECT store.store_id, SUM(payment.amount) AS total_revenue
	FROM store
		JOIN customer ON store.store_id = customer.store_id
		JOIN payment ON customer.customer_id = payment.customer_id
		GROUP BY store.store_id;

-- Query #3
	-- Average running time of films by category.
    
SELECT category.category_id, AVG(film.length) AS avg_lenght
	FROM category
		JOIN film_category ON category.category_id = film_category .category_id
		JOIN film ON film_category.film_id = film.film_id
		GROUP BY category.category_id;    

-- Query #4
SELECT * FROM film_category;
	 -- longest film categories
SELECT category.name, AVG(film.length) AS avg_length
	FROM category
		JOIN film_category ON category.category_id = film_category .category_id
		JOIN film ON film_category.film_id = film.film_id
	GROUP BY category.category_id
	ORDER BY avg_length DESC; 
        

-- Query #5
SELECT * FROM rental;
	-- Most frequently rented movies in descending order
SELECT film.title, COUNT(*) AS rental_count
	FROM rental
		JOIN inventory ON rental.inventory_id = inventory.inventory_id
		JOIN film ON inventory.film_id = film.film_id
	GROUP BY film.title
	ORDER BY rental_count DESC;
    

    
-- Query #6 
SELECT * FROM payment;
	-- Top five genres in gross revenue in descending order.
SELECT category.name, SUM(payment.amount) AS revenue
FROM film
	JOIN film_category ON film.film_id = film.film_id
    JOIN category ON film_category.category_id = category.category_id
    JOIN inventory ON film.film_id = inventory.film_id
    JOIN rental ON inventory.inventory_id = rental.inventory_id
    JOIN payment ON rental.rental_id = payment.rental_id-- both share customer_id and staff_id
GROUP BY category.name
ORDER BY revenue DESC;
	
-- i really try it :(

-- Query #7 
	-- Is "Academy Dinosaur" available for rent from Store 1?