SELECT * 
FROM
(SELECT S.id, COUNT(S.id) AS CoursesEnrolledInSelfDepartment
FROM Students AS S
JOIN Enrollments AS E
ON S.id = E.student_id
JOIN Courses AS C
ON C.id = E.course_id
WHERE C.department = S.department
GROUP BY S.id) AS T1

JOIN


(SELECT T1.id, T1.department, T2.Count_Department
FROM Courses AS T1
JOIN
(SELECT COUNT(department) AS Count_Department, C.department
FROM Courses AS C
GROUP BY C.department) AS T2
ON T1.department = T2.department) AS T2
ON T1.id = T2.id AND T1.CoursesEnrolledInSelfDepartment = T2.Count_Department;