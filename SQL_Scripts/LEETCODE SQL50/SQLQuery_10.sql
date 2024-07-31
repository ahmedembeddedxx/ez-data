/* Write your T-SQL query statement below */
SELECT machine_id, ROUND(AVG(diff), 3) AS processing_time
FROM (SELECT SA.machine_id, (EA.timestamp - SA.timestamp) AS diff
FROM Activity AS SA
LEFT OUTER JOIN Activity AS EA
ON SA.machine_id = EA.machine_id AND SA.process_id = EA.process_id AND SA.activity_type != EA.activity_type
WHERE SA.activity_type = 'start') AS T
GROUP BY machine_id;