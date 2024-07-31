CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor VARCHAR(100)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Students (student_id, first_name, last_name, date_of_birth)
VALUES
    (1, 'John', 'Doe', '1995-05-15'),
    (2, 'Jane', 'Smith', '1998-09-20'),
    (3, 'Alice', 'Johnson', '1997-03-13'),
    (4, 'Ella', 'Johnson', '1996-07-12'),
    (5, 'Liam', 'Brown', '1999-02-25'),
    (6, 'Ava', 'Miller', '1998-11-18'),
    (7, 'Noah', 'Garcia', '1997-09-03'),
    (8, 'Olivia', 'Martinez', '1996-04-29'),
    (9, 'Emma', 'Lopez', '1998-06-21'),
    (10, 'William', 'Davis', '1997-03-14'),
    (11, 'Sophia', 'Rodriguez', '1999-08-05'),
    (12, 'James', 'Hernandez', '1995-12-08'),
    (13, 'Charlotte', 'Young', '1996-10-17'),
    (14, 'Benjamin', 'Lee', '1998-05-20'),
    (15, 'Amelia', 'Walker', '1997-01-23');

INSERT INTO Courses (course_id, course_name, instructor)
VALUES
    (101, 'Introduction to Database', 'Professor Smith'),
    (102, 'Web Development Basics', 'Professor Johnson'),
    (103, 'Data Analysis Techniques', 'Professor Brown'),
    (104, 'Advanced Database Management', 'Professor Johnson'),
    (105, 'Data Mining Techniques', 'Professor Lee'),
    (106, 'Web Application Development', 'Professor Martinez'),
    (107, 'Software Engineering Principles', 'Professor Davis'),
    (108, 'Network Security Fundamentals', 'Professor Rodriguez'),
    (109, 'Artificial Intelligence Fundamentals', 'Professor Hernandez'),
    (110, 'Database Design and Optimization', 'Professor Young'),
    (111, 'Mobile App Development', 'Professor Walker'),
    (112, 'Cloud Computing Technologies', 'Professor Moore'),
    (113, 'Human-Computer Interaction', 'Professor Turner'),
    (114, 'Business Analytics', 'Professor Perez'),
    (115, 'Computer Graphics and Visualization', 'Professor Foster');


INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
    (1, 1, 101, '2023-01-15'),
    (2, 1, 102, '2023-02-20'),
    (3, 2, 101, '2023-01-15'),
    (4, 3, 103, '2023-03-05'),
    (5, 4, 104, '2023-02-10'),
    (6, 5, 105, '2023-03-15'),
    (7, 6, 106, '2023-01-22'),
    (8, 7, 107, '2023-04-05'),
    (9, 8, 108, '2023-02-28'),
    (10, 10, 109, '2023-01-10'),
    (11, 10, 110, '2023-03-18'),
    (12, 11, 112, '2023-02-08'),
    (13, 12, 112, '2023-03-02'),
    (14, 13, 113, '2023-04-12'),
    (15, 14, 114, '2023-01-29'),
    (16, 15, 115, '2023-03-21');


-- QUERY 1 
CREATE VIEW StudentList
AS
SELECT Students.student_id AS student_id, Students.first_name + ' ' + Students.last_name AS Name, Students.date_of_birth AS DOB
FROM Students;

-- QUERY 2
SELECT TOP 5 *
FROM StudentList
ORDER BY student_id;


-- QUERY 3
ALTER VIEW StudentList
AS
SELECT Students.first_name + ' ' + Students.last_name AS Name, Students.date_of_birth AS DOB, DATEDIFF( YEAR,Students.date_of_birth, GETDATE()) AS Age
FROM Students;

-- QUERY 4
CREATE VIEW CourseEnrollments
AS 
SELECT C.course_id AS CourseID, C.course_name AS CourseName, COUNT(C.course_id) AS NoOfEnrolledStudents
FROM Enrollments E
JOIN Courses C
ON E.course_id = C.course_id
GROUP BY C.course_id, C.course_name;


-- QUERY 5
SELECT TOP 1 *
FROM CourseEnrollments
ORDER BY NoOfEnrolledStudents DESC;


-- QUERY 6
ALTER VIEW CourseEnrollments
AS
SELECT C.course_id AS CourseID, C.course_name AS CourseName, COUNT(C.course_id) AS NoOfEnrolledStudents, C.instructor AS Instructor
FROM Enrollments E
JOIN Courses C
ON E.course_id = C.course_id
GROUP BY C.course_id, C.course_name, C.instructor;

-- QUERY 7
SELECT S.Name AS StudentName
FROM Enrollments E
JOIN StudentList S
ON E.student_id = S.student_id
WHERE E.course_id = (SELECT TOP 1 CourseID FROM CourseEnrollments ORDER BY NoOfEnrolledStudents DESC)


-- QUERY 8
DROP VIEW CourseEnrollments;
DROP VIEW StudentList;

-- QUERY 9
CREATE VIEW StudentCourseCount
AS
SELECT S.first_name + ' ' + S.last_name AS StudentName, COUNT(S.student_id) AS NoOfEnrolledCourse 
FROM Enrollments E
JOIN Students S
ON E.student_id = S.student_id
GROUP BY S.student_id, S.first_name + ' ' + S.last_name;

-- QUERY 10
SELECT * 
FROM StudentCourseCount
WHERE StudentCourseCount.NoOfEnrolledCourse = 
(SELECT MAX(NoOfEnrolledCourse)
FROM StudentCourseCount);

-- QUERY 11
CREATE VIEW InstructorCourseCount
AS
SELECT instructor AS InstructorName, COUNT(instructor) AS Teaching
FROM Enrollments E
JOIN Courses C
ON E.course_id = C.course_id
GROUP BY instructor;

-- QUERY 12
SELECT * 
FROM InstructorCourseCount
WHERE InstructorCourseCount.Teaching = 
(SELECT MAX(Teaching)
FROM InstructorCourseCount);

-- QUERY 13 (REFER https://database.guide/how-to-get-multiple-rows-into-a-comma-separated-list-in-sql/)
CREATE VIEW StudentEnrollments
AS
SELECT S.first_name + ' ' + S.last_name AS StudentName, STRING_AGG(C.course_name, ', ') AS EnrolledCourses
FROM Enrollments E
JOIN Courses C
ON E.course_id = C.course_id
JOIN Students S
ON S.student_id = E.student_id
GROUP BY S.first_name + ' ' + S.last_name;

-- QUERY 14
SELECT StudentCourseCount.StudentName, STRING_AGG(InstructorCourseCount.InstructorName, ', ') AS Instructors
FROM StudentCourseCount
JOIN StudentEnrollments
ON StudentCourseCount.StudentName = StudentEnrollments.StudentName
JOIN Students
ON StudentCourseCount.StudentName = Students.first_name + ' ' + Students.last_name
JOIN Enrollments
ON Students.student_id = Enrollments.student_id
JOIN Courses
ON Enrollments.course_id = Courses.course_id
JOIN InstructorCourseCount
ON Courses.instructor = InstructorCourseCount.InstructorName
WHERE StudentCourseCount.NoOfEnrolledCourse =
(SELECT MAX(NoOfEnrolledCourse)
FROM StudentCourseCount)
GROUP BY StudentCourseCount.StudentName, InstructorCourseCount.InstructorName;

-- QUERY 15
CREATE VIEW StudentCourseInfo
AS
SELECT S.first_name + ' ' + S.last_name AS StudentName, C.course_name AS CourseName, C.instructor AS Instructor
FROM Students S
JOIN Enrollments E
ON S.student_id = E.student_id
JOIN Courses C
ON C.course_id = E.course_id;
