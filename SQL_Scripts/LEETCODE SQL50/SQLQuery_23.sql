SELECT TOP 1 *
FROM 
(SELECT id, title, ISNULL(EnrollmentsRatio, 0) AS EnrollmentRatio
FROM Courses
LEFT JOIN 
(
SELECT course_id, ROUND(COUNT(student_id) * 100.00 / (SELECT COUNT(*) FROM Enrollments), 3) AS EnrollmentsRatio
FROM Enrollments
JOIN Courses
ON Courses.id = Enrollments.course_id
GROUP BY course_id) AS T2
ON Courses.id = T2.course_id) AS T
ORDER BY EnrollmentRatio DESC;

SELECT TOP 1 *
FROM 
(SELECT id, title, ISNULL(EnrollmentsRatio, 0) AS EnrollmentRatio
FROM Courses
LEFT JOIN 
(
SELECT course_id, ROUND(COUNT(student_id) * 100.00 / (SELECT COUNT(*) FROM Enrollments), 3) AS EnrollmentsRatio
FROM Enrollments
JOIN Courses
ON Courses.id = Enrollments.course_id
GROUP BY course_id) AS T2
ON Courses.id = T2.course_id) AS T
ORDER BY EnrollmentRatio ASC;