SELECT *
FROM 
(SELECT S.department, MAX(age) AS MaxAge
FROM Students AS S
LEFT JOIN Enrollments AS E
ON S.id = E.student_id
WHERE E.course_id IS NULL
GROUP BY S.department) AS t1
JOIN Students AS t2
ON t1.department = t2.department AND t1.MaxAge = t2.age;