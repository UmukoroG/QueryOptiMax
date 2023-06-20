-- The query below gives the number of reviews with a star rating = 1 and have at least one total vote.
SELECT product_category, COUNT(*) as count, SUM(TOTAL_VOTES) as total_votes
FROM (
	SELECT product_category, TOTAL_VOTES
	FROM mcdonelc.multilingual
	WHERE TOTAL_VOTES > 0 AND STAR_RATING = 1
	UNION ALL SELECT product_category, TOTAL_VOTES FROM mcdonelc.PC WHERE TOTAL_VOTES > 0 AND STAR_RATING = 1
	UNION ALL SELECT product_category, TOTAL_VOTES FROM mcdonelc.music WHERE TOTAL_VOTES > 0 AND STAR_RATING = 1
	UNION ALL SELECT product_category, TOTAL_VOTES FROM mcdonelc.APPAREL WHERE TOTAL_VOTES > 0 AND STAR_RATING = 1
	UNION ALL SELECT product_category, TOTAL_VOTES FROM mcdonelc.APPLIANCES WHERE TOTAL_VOTES > 0 AND STAR_RATING = 1
	UNION ALL SELECT product_category, TOTAL_VOTES FROM mcdonelc.automotive WHERE TOTAL_VOTES > 0 AND STAR_RATING = 1
	UNION ALL SELECT product_category, TOTAL_VOTES FROM mcdonelc.wireless WHERE TOTAL_VOTES > 0 AND STAR_RATING = 1
) AS all_reviews
GROUP BY product_category
ORDER BY COUNT(*) DESC
LIMIT 10;
