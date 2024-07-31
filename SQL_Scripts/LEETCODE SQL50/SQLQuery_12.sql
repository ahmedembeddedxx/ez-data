/* Write your T-SQL query statement below */

SELECT St.student_id, St.student_name, Sb.subject_name , COUNT(E.subject_name) AS attended_exams
FROM Subjects AS Sb
CROSS JOIN Students AS St
LEFT JOIN Examinations AS E
ON E.student_id = St.student_id AND E.subject_name = Sb.subject_name
GROUP BY Sb.subject_name, St.student_Id, St.student_name
ORDER BY St.student_Id, Sb.subject_name


