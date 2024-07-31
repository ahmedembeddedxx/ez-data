/* Write your T-SQL query statement below */
SELECT W1.id
FROM Weather AS W1
LEFT JOIN Weather AS W2
ON W2.recordDate = DATEADD(day, -1, W1.recordDate)
WHERE W1.temperature>W2.temperature;

