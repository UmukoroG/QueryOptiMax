WITH all AS (
SELECT customer_id, count(review_id) AS reviews, sum(helpful_votes) AS votes
FROM MCDONELC.APPAREL
GROUP BY customer_id
UNION
SELECT customer_id, count(review_id) AS reviews, sum(helpful_votes) AS votes
FROM MCDONELC.APPLIANCES
GROUP BY customer_id
UNION
SELECT customer_id, count(review_id) AS reviews, sum(helpful_votes) AS votes
FROM MCDONELC.AUTOMOTIVE
GROUP BY customer_id
UNION
SELECT customer_id, count(review_id) AS reviews, sum(helpful_votes) AS votes
FROM MCDONELC.MULTILINGUAL
GROUP BY customer_id
UNION
SELECT customer_id, count(review_id) AS reviews, sum(helpful_votes) AS votes
FROM MCDONELC.MUSIC
GROUP BY customer_id
UNION
SELECT customer_id, count(review_id) AS reviews, sum(helpful_votes) AS votes
FROM MCDONELC.PC
GROUP BY customer_id
UNION
SELECT customer_id, count(review_id) AS reviews, sum(helpful_votes) AS votes
FROM MCDONELC.WIRELESS
GROUP BY customer_id),
totals AS (
SELECT customer_id, sum(reviews) AS total_reviews, sum(votes) AS total_votes
FROM all
GROUP BY customer_id)
SELECT customer_id, total_reviews, total_votes, total_votes/total_reviews as vpr
FROM totals ORDER BY vpr DESC
LIMIT 10;
