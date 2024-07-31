/* Write your T-SQL query statement below */

SELECT ManagerAsEmployee.name
FROM
(SELECT managerId
FROM Employee
GROUP BY managerId
HAVING COUNT(managerId)>=5) AS Managers
JOIN Employee AS ManagerAsEmployee
ON ManagerAsEmployee.id = Managers.managerId;
