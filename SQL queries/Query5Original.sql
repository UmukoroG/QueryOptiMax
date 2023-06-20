-- The query below returns the top ten most reviewed products.
with all as (
select review_id, product_id, product_title from MCDONELC.apparel
union
select review_id, product_id, product_title from MCDONELC.appliances
union
select review_id, product_id, product_title from MCDONELC.automotive
union
select review_id, product_id, product_title from MCDONELC.multilingual
union
select review_id, product_id, product_title from MCDONELC.music
union
select review_id, product_id, product_title from MCDONELC.pc
union
select review_id, product_id, product_title from MCDONELC.wireless)
SELECT product_title, count(review_id) as review_count FROM all
GROUP BY product_title
ORDER BY review_count DESC
LIMIT 10