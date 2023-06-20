-- The query below returns information about customers who reviewed both automotive and computer products.
SELECT * FROM MCDONELC.automotive t1
INNER JOIN
MCDONELC.pc t2 ON t1.customer_id=t2.customer_id;