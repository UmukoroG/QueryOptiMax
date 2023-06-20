-- The query below returns the total number of reviews for each star rating
SELECT star_rating, count(review_id) AS num_reviews
FROM (
  SELECT review_id, star_rating FROM MCDONELC.apparel
  UNION ALL
  SELECT review_id, star_rating FROM MCDONELC.appliances
  UNION ALL
  SELECT review_id, star_rating FROM MCDONELC.automotive
  UNION ALL
  SELECT review_id, star_rating FROM MCDONELC.multilingual
  UNION ALL
  SELECT review_id, star_rating FROM MCDONELC.music
  UNION ALL
  SELECT review_id, star_rating FROM MCDONELC.pc
  UNION ALL
  SELECT review_id, star_rating FROM MCDONELC.wireless
) AS all_reviews
GROUP BY star_rating;