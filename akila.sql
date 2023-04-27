-- q.1
SELECT store_id, city, country
	FROM store
	JOIN address
	ON address.address_id = store.address_id
	JOIN city
	ON city.city_id = address.city_id
	JOIN country
	ON country.country_id = city.country_id;
-- q.2
SELECT store.store_id, SUM(payment.amount) as revenue
	FROM store
	JOIN staff
	ON store.store_id = staff.store_id
	JOIN payment
	ON staff.staff_id = payment.staff_id
	GROUP BY store.store_id;

-- q.3
SELECT category.name, AVG(film.length) AS avg_running_time
	FROM category
	JOIN film_category
	ON category.category_id = film_category.category_id
	JOIN film
	ON film_category.film_id = film.film_id
	GROUP BY category.name;

-- q.4
SELECT category.name, MAX(film.length) AS max_running_time
	FROM category
	JOIN film_category
	ON category.category_id = film_category.category_id
	JOIN film
	ON film_category.film_id = film.film_id
	GROUP BY category.name
	ORDER BY max_running_time DESC;

-- q.5
SELECT film.title, COUNT(rental.rental_id) AS rental_count
	FROM film
	JOIN inventory
	ON film.film_id = inventory.film_id
	JOIN rental
	ON inventory.inventory_id = rental.inventory_id
	GROUP BY film.title
	ORDER BY rental_count DESC;
