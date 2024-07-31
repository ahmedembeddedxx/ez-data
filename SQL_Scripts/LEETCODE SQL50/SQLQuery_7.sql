/* Write your T-SQL query statement below */
SELECT P.product_name, S.year, S.price
FROM Sales AS S
LEFT OUTER JOIN Product AS P
ON S.product_id = P.product_id
