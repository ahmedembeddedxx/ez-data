/* Write your T-SQL query statement below */
SELECT contest_id, ROUND((COUNT(contest_id) * 100.00)/(SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC