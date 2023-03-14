--1. How many actors are there with the last name ‘Wahlberg’?
SELECT count(*)
FROM actor 
WHERE last_name = 'Wahlberg'

--
--2. How many payments were made between $3.99 and $5.99?
SELECT count(*)
FROM payment 
WHERE amount BETWEEN 3.99 AND 5.99

--
--3. What films have exactly 7 copies? (search in inventory)
SELECT count(*), film_id
FROM inventory
GROUP BY film_id having count(*) = 7

--
--4. How many customers have the first name ‘Willie’?

SELECT count(*)
FROM customer
WHERE first_name = 'Willie'
--
--5. What store employee (get the id) sold the most rentals (use the rental table)?

SELECT count(*), staff_id
FROM rental
GROUP BY staff_id
LIMIT 1


--
--6. How many unique district names are there?
SELECT count(DISTINCT district)
FROM address

--
--7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT count(actor_id), film_id 
FROM film_actor
GROUP BY film_id
ORDER BY count(actor_id) DESC
LIMIT 1

--
--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT count(*) FROM customer
WHERE store_id = 1 AND last_name LIKE '%es'

--
--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
SELECT count(*), amount, customer_id
FROM payment
GROUP BY amount, customer_id
HAVING customer_id BETWEEN 380 AND 430

--
--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?

SELECT count (DISTINCT rating) 
FROM film

SELECT count(title), rating
FROM film
GROUP BY rating
ORDER BY count(title) DESC
LIMIT 1