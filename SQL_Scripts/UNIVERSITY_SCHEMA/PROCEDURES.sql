DROP TABLE Grades;
DROP TABLE Enrollments;
DROP TABLE Courses;
DROP TABLE Students;
CREATE TABLE Students (
studentID INT IDENTITY(1,1) PRIMARY KEY,
name VARCHAR(50),
age INT,
rollNo VARCHAR(50),
major VARCHAR(50)
);
-- Create the Courses table
CREATE TABLE Courses (
courseID INT IDENTITY(1,1) PRIMARY KEY ,
courseName VARCHAR(50),
instructor VARCHAR(50),
department VARCHAR(50),
creditHour INT
);
-- Create the Enrollments table
CREATE TABLE Enrollments (
enrollmentID INT IDENTITY(1,1) PRIMARY KEY ,
studentID INT,
courseID INT,
FOREIGN KEY (studentID) REFERENCES Students(studentID) ON DELETE CASCADE,
FOREIGN KEY (courseID) REFERENCES Courses(courseID) ON DELETE CASCADE,
);
-- Create the Grades table
CREATE TABLE Grades (
gradeID INT IDENTITY(1,1) PRIMARY KEY ,
enrollmentID INT,
grade DECIMAL(4,2),
FOREIGN KEY (enrollmentID) REFERENCES Enrollments(enrollmentID) ON DELETE CASCADE
);
-- Inserting records into the Students table
INSERT INTO Students (name, age, rollNo, major) VALUES ('Giselle Collette', 20, 'l201234', 'Computer Science');
INSERT INTO Students (name, age, rollNo, major) VALUES ('Emily Davis', 22, 'l212342','Data Science');
INSERT INTO Students (name, age, rollNo, major) VALUES ('Kaeya Alberich', 21,'l203451', 'Mathematics');
INSERT INTO Students (name, age, rollNo, major) VALUES ('Florence Nightingale', 23,'l203452', 'Data Science');
INSERT INTO Students (name, age, rollNo, major) VALUES ('Waver Velvet', 21, 'l224324','Data Science');
INSERT INTO Students (name, age, rollNo, major) VALUES ('Benedict Blue', 21, 'l214984','Computer Science');
-- Inserting records into the Courses table
INSERT INTO Courses (courseName, instructor, department, creditHour) VALUES ('Database Systems', 'Prof. Smith', 'CS', 4);
INSERT INTO Courses (courseName, instructor, department, creditHour) VALUES ('Web Development', 'Prof. Jonathan', 'CS', 4);
INSERT INTO Courses (courseName, instructor, department, creditHour) VALUES ('Theory of Automata', 'Prof. Williams', 'CS', 3);
INSERT INTO Courses (courseName, instructor, department, creditHour) VALUES ('Machine Learning', 'Prof. Williams', 'CS', 3);
INSERT INTO Courses (courseName, instructor, department, creditHour) VALUES ('Discrete Structures', 'Prof. Horace', 'CS', 3);
INSERT INTO Courses (courseName, instructor, department, creditHour) VALUES ('Numeric Computing', 'Prof. Sarah', 'MTH', 3);
-- Inserting records into the Enrollments table
INSERT INTO Enrollments (studentID, courseID) VALUES (1, 1);
INSERT INTO Enrollments (studentID, courseID) VALUES (2, 1);
INSERT INTO Enrollments (studentID, courseID) VALUES (2, 2);
INSERT INTO Enrollments (studentID, courseID) VALUES (3, 3);
INSERT INTO Enrollments (studentID, courseID) VALUES (5, 4);
INSERT INTO Enrollments (studentID, courseID) VALUES (5, 3);
INSERT INTO Enrollments (studentID, courseID) VALUES (5, 6);
INSERT INTO Enrollments (studentID, courseID) VALUES (6, 1);
-- Inserting records into the Grades table
INSERT INTO Grades (enrollmentID, grade) VALUES (1, 3.3);
INSERT INTO Grades (enrollmentID, grade) VALUES (2, 2.7);
INSERT INTO Grades (enrollmentID, grade) VALUES (3, 2.3);
INSERT INTO Grades (enrollmentID, grade) VALUES (4, 4);
INSERT INTO Grades (enrollmentID, grade) VALUES (5, 3.3);
INSERT INTO Grades (enrollmentID, grade) VALUES (6, 3.7);
INSERT INTO Grades (enrollmentID, grade) VALUES (7, 3);
INSERT INTO Grades (enrollmentID, grade) VALUES (8, 3.7);




-- PROCEDURE 1
CREATE PROCEDURE getUnenrolledStudents
AS
BEGIN
SELECT * FROM Students
WHERE Students.studentID NOT IN
(SELECT DISTINCT studentID FROM Enrollments)
END;

-- PROCEDURE 2
CREATE PROCEDURE updateStudentAge @studentID INT, @newAge INT
AS
BEGIN
UPDATE Students
SET age = @newAge
WHERE studentID = @studentID
END;

-- PROCEDURE 3
CREATE PROCEDURE deleteStudent @studentID INT
AS
BEGIN
DELETE FROM Students
WHERE studentID = @studentID
END;

-- PROCEDURE 4
CREATE PROCEDURE getCourseStudents @courseID INT
AS BEGIN
SELECT *
FROM Students S
JOIN Enrollments E
ON S.studentID = E.studentID
WHERE E.courseID = @courseID
END;

-- PROCEDURE 5
CREATE PROCEDURE getStudentInfo @studentID INT
AS BEGIN
SELECT S.name, S.rollNo, S.major, C.courseName, c.department
FROM Students S
JOIN Enrollments E
ON S.studentID = E.studentID
JOIN Courses C
ON C.courseID = E.courseID
WHERE S.studentID = @studentID
END;

-- PROCEDURE 6
CREATE PROCEDURE getMostPopularCourse @department VARCHAR(50) = "CS"
AS BEGIN
SELECT * FROM Courses
WHERE Courses.courseID IN
(SELECT TOP 1 C.courseID
FROM Enrollments E
JOIN Courses C
ON C.courseID = E.courseID
WHERE department = @department
GROUP BY C.courseID, C.courseName
ORDER BY COUNT(C.courseID) DESC);
END;

-- PROCEDURE 7
CREATE PROCEDURE calculateCourseGPA @courseID INT, @Result DECIMAL(4, 2) OUTPUT
AS BEGIN
SET @Result =
(SELECT SUM(G.grade * C.creditHour)/SUM(C.creditHour)
FROM Grades G
JOIN Enrollments E
ON G.enrollmentID = E.enrollmentID
JOIN Courses C
ON C.courseID = E.courseID
WHERE C.courseID = @courseID)
END;

-- ALTER PROCEDURE
ALTER PROCEDURE calculateCourseGPA
AS
BEGIN
DECLARE @AverageGPA DECIMAL(4, 2);
SET @AverageGPA = (
SELECT SUM(G.grade * C.creditHour) / SUM(C.creditHour) AS AverageGPA
FROM Grades G
JOIN Enrollments E 
ON G.enrollmentID = E.enrollmentID
JOIN 
Courses C ON C.courseID = E.courseID);
END;

-- PROCEDURE 9
CREATE PROCEDURE getCourseEnrollmentCount @courseID INT
AS
BEGIN
DECLARE @EnrollmentCount INT;
SELECT @EnrollmentCount = COUNT(*)
FROM Enrollments
WHERE courseID = @courseID;
END;


-- PROCEDURE 10
CREATE PROCEDURE getCourseWithoutGrades
AS
BEGIN
SELECT C.courseID, C.courseName, C.instructor, C.department, C.creditHour
FROM Courses C
LEFT JOIN Enrollments E 
ON C.courseID = E.courseID
LEFT JOIN Grades G 
ON E.enrollmentID = G.enrollmentID
WHERE G.grade IS NULL
GROUP BY C.courseID, C.courseName, C.instructor, C.department, C.creditHour;
END;

