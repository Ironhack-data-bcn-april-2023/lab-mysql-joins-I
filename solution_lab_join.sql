USE sakila;
SELECT * FROM store;

-- Write a query to display for each store its store ID, city, and country.
SELECT store_id, city, country FROM store
JOIN address
ON address.address_id = store.address_id
JOIN city
ON city.city_id = address.city_id
JOIN country
ON country.country_id = city.country_id;

-- Write a query to display how much business, in dollars, each store brought in.
SELECT store_id, SUM(amount) FROM customer
JOIN payment
ON payment.customer_id = customer.customer_id
GROUP BY store_id;

-- What is the average running time of films by category?
select name, AVG(length) from film
JOIN film_category
ON film_category.film_id = film.film_id
JOIN category
ON category.category_id = film_category.category_id
GROUP BY name;

-- What is the average running time of films by category?
select name, AVG(length) from film
JOIN film_category
ON film_category.film_id = film.film_id
JOIN category
ON category.category_id = film_category.category_id
GROUP BY name;

-- Which film categories are longest?
select name, AVG(length) from film
JOIN film_category
ON film_category.film_id = film.film_id
JOIN category
ON category.category_id = film_category.category_id
GROUP BY name
ORDER BY AVG(length) DESC
LIMIT 1;

-- Display the most frequently rented movies in descending order.
select title, COUNT(rental_id) from film
JOIN inventory
ON inventory.film_id = film.film_id
JOIN rental
ON rental.inventory_id = inventory.inventory_id
GROUP BY title
ORDER BY COUNT(rental_id) DESC;

-- List the top five genres in gross revenue in descending order.
select name, SUM(amount) from category
JOIN film_category
ON film_category.category_id = category.category_id
JOIN inventory
ON inventory.film_id = film_category.film_id
JOIN rental
ON rental.inventory_id = inventory.inventory_id
JOIN payment
ON payment.rental_id = rental.rental_id
GROUP BY name
ORDER BY SUM(amount) DESC
LIMIT 5;

-- Is "Academy Dinosaur" available for rent from Store 1?

