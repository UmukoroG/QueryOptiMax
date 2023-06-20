-- The query below counts the number of reviews per product category between 1995-2000.
SELECT product_category, COUNT(review_id) AS count
FROM (
SELECT product_category,review_id FROM MCDONELC.APPAREL
WHERE review_date BETWEEN '1995-01-01' AND '2000-12-31'
UNION
SELECT product_category,review_id FROM MCDONELC.APPLIANCES
WHERE review_date BETWEEN '1995-01-01' AND '2000-12-31'
UNION
SELECT product_category,review_id FROM MCDONELC.AUTOMOTIVE
WHERE review_date BETWEEN '1995-01-01' AND '2000-12-31'
UNION
SELECT product_category,review_id FROM MCDONELC.MULTILINGUAL
WHERE review_date BETWEEN '1995-01-01' AND '2000-12-31'
UNION
SELECT product_category,review_id FROM MCDONELC.MUSIC
WHERE review_date BETWEEN '1995-01-01' AND '2000-12-31'
UNION
SELECT product_category,review_id FROM MCDONELC.PC
WHERE review_date BETWEEN '1995-01-01' AND '2000-12-31'
UNION
SELECT product_category,review_id FROM MCDONELC.WIRELESS
WHERE review_date BETWEEN '1995-01-01' AND '2000-12-31'
)
GROUP BY product_category
ORDER BY count DESC
LIMIT 10;
