SELECT C.id, C.title
FROM Students AS S
JOIN Enrollments AS E
ON S.id = E.student_id
JOIN Courses AS C
ON C.id = E.course_id
GROUP BY C.id, C.title
HAVING AVG(S.age) > 
(
    SELECT AVG(age)
    FROM Students
)
