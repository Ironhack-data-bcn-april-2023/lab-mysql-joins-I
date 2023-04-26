-- Write a query to display for each store its store ID, city, and country
USE sakila;
SELECT store_id, city, country
FROM store
    JOIN address
		ON store.address_id = address.address_id
    JOIN city
		ON address.city_id = city.city_id
	JOIN country
		ON city.country_id = country.country_id;
	-- 2. Write a query to display how much business, in dollars, each store brought in
    
SELECT store.store_id, SUM(payment.amount) 
FROM store
    JOIN customer
		ON store.store_id = customer.store_id
    JOIN payment
		ON customer.customer_id = payment.customer_id
		GROUP BY store.store_id;

-- 3. What is the average running time of films by category?

SELECT category.name, AVG(film.rental_duration) 
FROM category
    JOIN film_category
		ON category.category_id = film_category.category_id
    JOIN film
		ON film_category.film_id = film.film_id
		GROUP BY category.category_id;

-- Which film categories are longest?
SELECT category.name, AVG(film.length)
FROM category
    JOIN film_category
		ON category.category_id = film_category.category_id
    JOIN film
		ON film_category.film_id = film.film_id
		GROUP BY category.name
		ORDER BY AVG(film.length) DESC;
        
-- 5. Display the most frequently rented movies in descending order.
SELECT film.title, COUNT(rental.rental_id)
FROM film
    JOIN inventory
		ON film.film_id = inventory.film_id
    JOIN rental
		ON inventory.inventory_id = rental.inventory_id
		GROUP BY film.title
		ORDER BY COUNT(rental.rental_id) DESC
        LIMIT 5;
        
-- 6. List the top five genres in gross revenue in descending order.
SELECT film_category.category_id, SUM(film.rental_rate)
FROM film
    JOIN film_category
		ON film.film_id = film_category.film_id
		GROUP BY film_category.category_id
		ORDER BY COUNT(film.rental_rate) DESC
        LIMIT 5;
        
-- 7. Is "Academy Dinosaur" available for rent from Store 1?

SELECT film.title, inventory.store_id, rental.rental_id, rental.rental_date, rental.return_date 
FROM film
    JOIN inventory
		ON film.film_id = inventory.inventory_id
	JOIN rental
		ON inventory.inventory_id = rental.inventory_id
		WHERE film.title="ACADEMY DINOSAUR" AND inventory.store_id=1
        ORDER BY rental.rental_date DESC
        LIMIT 1
-- YES, IT'S AVAILABLE
        

