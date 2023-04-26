USE sakila;
-- Write a query to display for each store its store ID, city, and country.

SELECT store_id, city, country
FROM store
	JOIN address
		ON store.address_id = address.address_id
	JOIN city
		ON address.city_id = city.city_id
	JOIN country
        ON city.country_id=country.country_id

-- Write a query to display how much business, in dollars, each store brought in.

SELECT store.store_id, SUM(payment.amount)
FROM store
JOIN customer
		ON store.store_id = customer.store_id
	JOIN payment
		ON customer.customer_id = payment.customer_id
        GROUP BY store.store_id


-- What is the average running time of films by category?

SELECT category.name, AVG(film.rental_duration)
FROM category
JOIN film_category
		ON category.category_id = film_category.category_id
	JOIN film
		ON film_category.film_id = film.film_id
        GROUP BY category.name

-- Which film categories are longest?

SELECT category.name, AVG(film.length)
FROM category
JOIN film_category
		ON category.category_id = film_category.category_id
	JOIN film
		ON film_category.film_id = film.film_id
                GROUP BY category.name
                ORDER BY AVG(film.length) DESC

-- Display the most frequently rented movies in descending order. 

-- NOT SURE OF WHICH ONE IT IS: RENTAL_RATE OR COUNT OF RENTAL_IDS

SELECT film.title, film.rental_rate
FROM film
ORDER BY film.rental_rate DESC

SELECT film.title, COUNT(rental.rental_id) as total_rental
FROM film
JOIN inventory
ON inventory.film_id=film.film_id
JOIN rental 
ON inventory.inventory_id=rental.inventory_id
GROUP BY film.title
ORDER BY total_rental DESC

-- List the top five genres in gross revenue in descending order. 

SELECT category.name, SUM(payment.amount) AS total_amount
FROM payment
JOIN rental
ON payment.rental_id=rental.rental_id
JOIN inventory
ON rental.inventory_id=inventory.inventory_id
JOIN film
ON inventory.film_id=film.film_id
JOIN film_category
ON film.film_id=film_category.film_id
JOIN category
ON film_category.category_id=category.category_id
GROUP BY category.name
ORDER BY total_amount DESC


-- Is "Academy Dinosaur" available for rent from Store 1? YES

SELECT film.title, store.store_id
FROM film
JOIN inventory
ON film.film_id=inventory.film_id
JOIN store
ON inventory.store_id=store.store_id
WHERE film.title="Academy Dinosaur" and store.store_id=1


