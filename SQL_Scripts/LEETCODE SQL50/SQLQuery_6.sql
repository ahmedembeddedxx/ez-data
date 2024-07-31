/* Write your T-SQL query statement below */
SELECT EU.unique_id, E.name 
FROM Employees AS E 
LEFT OUTER JOIN EmployeeUni AS EU
ON EU.id = E.id;
