/* Write your T-SQL query statement below */
SELECT V.customer_id, COUNT(V.customer_id) AS count_no_trans
FROM Visits AS V
LEFT JOIN Transactions AS T
ON T.visit_id = V.visit_id
WHERE T.transaction_id IS NULL
GROUP BY V.customer_id;