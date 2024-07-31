/* Write your T-SQL query statement below */
SELECT P.project_id, ROUND(AVG(E.experience_years * 1.00), 2) AS average_years
FROM Project AS P
LEFT JOIN Employee AS E
ON E.employee_id = P.employee_id
GROUP BY P.project_id