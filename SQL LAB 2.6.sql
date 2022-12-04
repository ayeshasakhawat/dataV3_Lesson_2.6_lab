-- SQL LAB 2.6
-- In the table actor, which are the actors whose last names are not repeated?
--  For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
-- These three actors have the same last name. So we do not want to include this last name in our output. 
-- Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

USE sakila;

SELECT last_name
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(last_name) =1;
-- Ans. 66 last names are not repeated.alter

-- **********************************************************************************************************
-- Which last names appear more than once? 
-- We would use the same logic as in the previous question but 
-- this time we want to include the last names of the actors where the last name was present more than once. 
SELECT last_name
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;
-- Ans. 55 last names are repeated

-- **********************************************************************************************************
-- Using the rental table, find out how many rentals were processed by each employee.
SELECT COUNT(rental_id), staff_id
FROM sakila.rental
GROUP BY staff_id;
-- Ans. staff_id 1 has rented 8040 movies and staff_id 2 has rented 8004 movies.


-- **********************************************************************************************************
-- Using the film table, find out how many films were released each year.
SELECT COUNT(film_id), release_year
FROM sakila.film
GROUP BY release_year;
-- Ans. There were 1000 movies released in the year 2006

-- **********************************************************************************************************
-- Using the film table, find out for each rating how many films were there.
SELECT  rating,COUNT(film_id)
FROM sakila.film
GROUP BY rating;
-- Ans. Rating counts are >  PG = 194, G = 178, NC-17 = 210, PG-13 = 223, R = 195

-- **********************************************************************************************************
-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT ROUND(AVG(length),2) AS avg_film_length, rating
FROM sakila.film
GROUP BY rating;
-- Ans. avg_film_length per rating are > PG = 112.01, G = 111.05, NC-17 = 113.23, PG-13 = 120.44, R = 118.66

-- **********************************************************************************************************
-- Which kind of movies (rating) have a mean duration of more than two hours?
SELECT ROUND(AVG(length),2) AS mean_film_length, rating
FROM sakila.film
GROUP BY rating
HAVING ROUND(AVG(length),2) > 120;
-- Ans. PG-13 movies have a duration of more than 2 hours(120.44 mins). 

-- **********************************************************************************************************
-- Rank films by length (filter out the rows that have nulls or 0s in length column). 
-- In your output, only select the columns title, length, and the rank.

SELECT title, length, DENSE_RANK() OVER(ORDER BY length DESC) as 'Rank'
FROM film
WHERE length != 0 AND length IS NOT NULL;

-- Ans. Rank # 1 = movies with 185 minutes, Rank # 2 = movies with 184 minutes....


