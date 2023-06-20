-- The query below finds the top 10 customers who havemwritten the most reviews. The original SQL query is written below.
WITH all AS (
SELECT customer_id, COUNT(review_id) AS reviews FROM MCDONELC.APPAREL
GROUP BY customer_id
UNION
SELECT customer_id, COUNT(review_id) AS reviews FROM MCDONELC.APPLIANCES
GROUP BY customer_id
UNION
SELECT customer_id, COUNT(review_id) AS reviews FROM MCDONELC.AUTOMOTIVE
GROUP BY customer_id
UNION
SELECT customer_id, COUNT(review_id) AS reviews FROM MCDONELC.MULTILINGUAL
GROUP BY customer_id
UNION
SELECT customer_id, COUNT(review_id) AS reviews FROM MCDONELC.MUSIC
GROUP BY customer_id
UNION
SELECT customer_id, COUNT(review_id) AS reviews FROM MCDONELC.PC
GROUP BY customer_id
UNION
SELECT customer_id, COUNT(review_id) AS reviews FROM MCDONELC.WIRELESS
GROUP BY customer_id)
SELECT customer_id, SUM(reviews) AS total_reviews FROM all
GROUP BY customer_id
ORDER BY total_reviews DESC
LIMIT 10;