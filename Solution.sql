USE sakila;
-- Question 1
SELECT store_id, city, country FROM store
	JOIN address ON address.address_id = store.address_id
	JOIN city ON city.city_id = address.city_id
	JOIN country ON country.country_id = city.country_id;

-- Question 2   
SELECT SUM(amount), store_id FROM payment
	JOIN customer ON customer.customer_id = payment.customer_id
		GROUP BY store_id;

-- Question 3    
SELECT AVG(length), name FROM film
	JOIN film_category ON film_category.film_id = film.film_id
    JOIN category ON category.category_id = film_category.category_id
		GROUP BY name;

-- Question 4
SELECT AVG(length) as longest, name FROM film
	JOIN film_category ON film_category.film_id = film.film_id
    JOIN category ON category.category_id = film_category.category_id
		GROUP BY name ORDER BY longest DESC
        LIMIT 1;

-- Question 5
SELECT COUNT(rental_id) AS all_rentals, title FROM rental
	JOIN inventory ON inventory.inventory_id = rental.inventory_id
    JOIN film ON film.film_id = inventory.film_id
		GROUP BY title ORDER BY all_rentals DESC;
        
-- Question 6
SELECT SUM(amount) AS gross_revenue, name FROM payment
	JOIN rental ON rental.rental_id = payment.rental_id
    JOIN inventory ON inventory.inventory_id = rental.inventory_id
    JOIN film_category ON film_category.film_id = inventory.film_id
    JOIN category ON category.category_id = film_category.category_id
		GROUP BY name ORDER BY gross_revenue DESC
        LIMIT 5;
	
-- Question 7
SELECT