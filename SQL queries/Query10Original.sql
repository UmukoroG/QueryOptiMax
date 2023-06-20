-- The query below gets review id, helpful votes, prod- uct category, product title, product id, customer id, prod- uct parent, star rating from all tables in the database
WITH all AS (
    SELECT review_id, helpful_votes, product_category, product_title, product_id, customer_id, product_parent, star_rating
    FROM MCDONELC.apparel
    UNION
    SELECT review_id, helpful_votes, product_category, product_title, product_id, customer_id, product_parent, star_rating
    FROM MCDONELC.appliances
    UNION
    SELECT review_id, helpful_votes, product_category, product_title, product_id, customer_id, product_parent, star_rating
    FROM MCDONELC.automotive
    UNION
    SELECT review_id, helpful_votes, product_category, product_title, product_id, customer_id, product_parent, star_rating
    FROM MCDONELC.multilingual
    UNION
    SELECT review_id, helpful_votes, product_category, product_title, product_id, customer_id, product_parent, star_rating
    FROM MCDONELC.music
    UNION
    SELECT review_id, helpful_votes, product_category, product_title, product_id, customer_id, product_parent, star_rating
    FROM MCDONELC.pc
    UNION
    SELECT review_id, helpful_votes, product_category, product_title, product_id, customer_id, product_parent, star_rating
    FROM MCDONELC.wireless
  )
  SELECT *
  FROM all;