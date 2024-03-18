SELECT MIN(length) AS min_duration, MAX(length) AS max_duration FROM film;
SELECT FLOOR(AVG(length) / 60) AS hours, AVG(length) % 60 AS minutes FROM film;

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating_days FROM rental;
SELECT *, MONTH(rental_date) AS rental_month, DAYNAME(rental_date) AS rental_weekday FROM rental ORDER BY rental_date LIMIT 20;
SELECT *, CASE
    WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend'
    ELSE 'workday'
END AS DAY_TYPE FROM rental;

SELECT title, IFNULL(rental_duration, 'Not Available') AS rental_duration FROM film ORDER BY title ASC;

SELECT COUNT(*) AS total_films FROM film;
SELECT rating, COUNT(*) AS number_of_films FROM film GROUP BY rating;
SELECT rating, COUNT(*) AS number_of_films FROM film GROUP BY rating ORDER BY number_of_films DESC;

SELECT rating, ROUND(AVG(length), 2) AS avg_duration FROM film GROUP BY rating ORDER BY avg_duration DESC;
SELECT rating, ROUND(AVG(length), 2) AS avg_duration FROM film GROUP BY rating HAVING AVG(length) > 120;
