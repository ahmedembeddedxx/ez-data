-- /* Write your T-SQL query statement below */
SELECT S.product_id, S.year AS first_year, S.quantity, S.price
FROM Sales AS S
JOIN 
(    
    SELECT product_id, MIN(year) AS year
    FROM Sales
    GROUP BY product_id
) AS First_Sales
ON S.product_id = First_Sales.product_id AND First_Sales.year = S.year;