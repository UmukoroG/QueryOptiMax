-- The query below shows the product categories that have the greatest percentage of 5-star reviews.

WITH review_count as (
	SELECT product_category, sum(r) as reviews FROM (
		SELECT product_category, count(review_id) as r FROM MCDONELC.apparel
		GROUP BY product_category
		UNION ALL
		SELECT product_category, count(review_id) as r FROM MCDONELC.appliances
		GROUP BY product_category
		UNION ALL
		SELECT product_category, count(review_id) as r FROM MCDONELC.automotive
		GROUP BY product_category
		UNION ALL
		SELECT product_category, count(review_id) as r FROM MCDONELC.multilingual
		GROUP BY product_category
		UNION ALL
		SELECT product_category, count(review_id) as r FROM MCDONELC.music
		GROUP BY product_category
		UNION ALL
		SELECT product_category, count(review_id) as r FROM MCDONELC.pc
		GROUP BY product_category
		UNION ALL
		SELECT product_category, count(review_id) as r FROM MCDONELC.wireless
		GROUP BY product_category
	)
	GROUP BY product_category
),
fstar_count as (
	SELECT product_category, sum(five) as five_stars FROM (
SELECT product_category, count(STAR_RATING) as five FROM MCDONELC.apparel where STAR_RATING = 5
		GROUP BY product_category
		UNION ALL
SELECT product_category, count(STAR_RATING) as five FROM MCDONELC.appliances where STAR_RATING = 5
		GROUP BY product_category
		UNION ALL
SELECT product_category, count(STAR_RATING) as five FROM MCDONELC.automotive where STAR_RATING = 5
		GROUP BY product_category
		UNION ALL
SELECT product_category, count(STAR_RATING) as five FROM MCDONELC.multilingual where STAR_RATING = 5
		GROUP BY product_category
		UNION ALL
SELECT product_category, count(STAR_RATING) as five FROM MCDONELC.music where STAR_RATING = 5
		GROUP BY product_category
		UNION ALL
SELECT product_category, count(STAR_RATING) as five FROM MCDONELC.pc where STAR_RATING = 5
		GROUP BY product_category
		UNION ALL
SELECT product_category, count(STAR_RATING) as five FROM MCDONELC.wireless WHERE STAR_RATING = 5
		GROUP BY product_category
		)
	GROUP BY product_category
	)
SELECT review_count.product_category, reviews, five_stars, DEC(DEC(five_stars,9,2)/DEC(reviews,9,2)*100,3,1) as five_stars_per_review FROM 
review_count JOIN fstar_count ON review_count.product_category LIKE fstar_count.product_category
ORDER BY five_stars_per_review DESC
LIMIT 10;
