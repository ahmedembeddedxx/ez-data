SELECT TOP 1 COUNT(department) AS Count_Department, C.department
FROM Courses AS C
GROUP BY C.department
ORDER BY Count_Department