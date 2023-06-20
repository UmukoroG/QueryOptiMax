-- The query finds the top 10 customers with the most helpful votes
WITH all AS (
SELECT customer_id, review_id, helpful_votes FROM MCDONELC.APPAREL
UNION
SELECT customer_id, review_id, helpful_votes FROM MCDONELC.APPLIANCES
UNION
SELECT customer_id, review_id, helpful_votes FROM MCDONELC.AUTOMOTIVE
UNION
SELECT customer_id, review_id, helpful_votes FROM MCDONELC.MULTILINGUAL
UNION
SELECT customer_id, review_id, helpful_votes FROM MCDONELC.MUSIC
UNION
SELECT customer_id, review_id, helpful_votes FROM MCDONELC.PC
UNION
SELECT customer_id, review_id, helpful_votes FROM MCDONELC.WIRELESS),
votes AS (
SELECT customer_id, COUNT(review_id) AS number_of_reviews, SUM(helpful_votes)
AS total_votes FROM all
GROUP BY customer_id)
SELECT votes.customer_id, votes.number_of_reviews, votes.total_votes, votes.total_votes/votes.number_of_reviews as votes_per_review 
FROM votes
ORDER BY votes_per_review DESC
LIMIT 10;
