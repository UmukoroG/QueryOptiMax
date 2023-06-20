SELECT t.customer_id, SUM(t.total_helpful_votes) AS total_helpful_votes
FROM (
  SELECT t1.customer_id, COALESCE(t1.helpful_votes, 0) + COALESCE(t2.helpful_votes, 0) AS total_helpful_votes
  FROM MCDONELC.apparel t1
  RIGHT OUTER JOIN MCDONELC.music t2
  ON t1.customer_id = t2.customer_id
) AS t
GROUP BY t.customer_id
ORDER BY total_helpful_votes DESC;
