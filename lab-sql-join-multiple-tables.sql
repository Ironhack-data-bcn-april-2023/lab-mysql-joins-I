use sakila;

-- Query 1:
SELECT store.store_id, city, country
FROM store
JOIN address
ON store.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id;

-- Query 2:
SELECT store.store_id, SUM(payment.amount) as revenue
FROM store
JOIN staff
ON store.store_id = staff.store_id
JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY store.store_id;

-- Query 3:
SELECT category.name, AVG(film.length) AS avg_running_time
FROM category
JOIN film_category
ON category.category_id = film_category.category_id
JOIN film
ON film_category.film_id = film.film_id
GROUP BY category.name;

-- Query 4:
SELECT category.name, MAX(film.length) AS max_running_time
FROM category
JOIN film_category
ON category.category_id = film_category.category_id
JOIN film
ON film_category.film_id = film.film_id
GROUP BY category.name
ORDER BY max_running_time DESC;

-- Query 5:
SELECT film.title, COUNT(rental.rental_id) AS rental_count
FROM film
JOIN inventory
ON film.film_id = inventory.film_id
JOIN rental
ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title
ORDER BY rental_count DESC;

-- Query 6:
SELECT category.name, SUM(payment.amount) AS revenue
FROM category
JOIN film_category
ON category.category_id = film_category.category_id
JOIN inventory
ON film_category.film_id = inventory.film_id
JOIN rental
ON inventory.inventory_id = rental.inventory_id
JOIN payment
ON rental.rental_id = payment.rental_id
GROUP BY category.name
ORDER BY revenue DESC
LIMIT 5;

-- Query 7:
SELECT inventory.inventory_id
FROM inventory
JOIN film
ON inventory.film_id = film.film_id
JOIN store
ON inventory.store_id = store.store_id
WHERE store.store_id = 1 AND film.title = "Academy Dinosaur";



