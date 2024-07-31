-- go
-- create table Students
-- (
-- 	RollNo varchar(7) primary key,
-- 	Name varchar(30),
-- 	WarningCount int,
-- 	Department varchar(15)
-- )
-- GO
-- INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'1', N'Ali', 0, N'CS')
-- INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'2', N'Bilal', 0, N'CS')
-- INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'3', N'Ayesha', 0, N'CS')
-- INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'4', N'Ahmed', 0, N'CS')
-- INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'5', N'Sara', 0, N'EE')
-- INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'6', N'Salman', 1, N'EE')
-- INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'7', N'Zainab', 2, N'CS')
-- INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'8', N'Danial', 1, N'CS')

-- go
-- create table Courses
-- (
-- CourseID int primary key,
-- CourseName varchar(40),
-- PrerequiteCourseID int,
-- CreditHours int
-- ) 
-- GO
-- INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (10, N'Database Systems', 20, 3)
-- INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (20, N'Data Structures', 30,3)
-- INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (30, N'Programing', NULL,3)
-- INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (40, N'Basic Electronics', NULL,3)
-- go

-- go
-- Create table Instructors 
-- (
-- InstructorID int Primary key,
-- Name varchar(30),
-- Department varchar(7) ,
-- )
-- GO
-- INSERT [dbo].[Instructors] ([InstructorID], [Name], [Department]) VALUES (100, N'Ishaq Raza', N'CS')
-- INSERT [dbo].[Instructors] ([InstructorID], [Name], [Department]) VALUES (200, N'Zareen Alamgir', N'CS')
-- INSERT [dbo].[Instructors] ([InstructorID], [Name], [Department]) VALUES (300, N'Saima Zafar', N'EE')
-- go
-- Create table Semester
-- (
-- Semester varchar(15) Primary key,
-- [Status] varchar(10),
-- )
-- GO
-- INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Fall2016', N'Complete')
-- INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Spring2016', N'Complete')
-- INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Spring2017', N'InProgress')
-- INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Summer2016', N'Cancelled')
-- go
-- Create table Courses_Semester
-- (
-- InstructorID int Foreign key References Instructors(InstructorID),
-- CourseID int Foreign key References Courses(CourseID),
-- Semester varchar(15) Foreign key References Semester(Semester), 
-- Section varchar(1) ,
-- AvailableSeats int,
-- Department varchar(2)
-- )
-- GO
-- INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (200, 10, N'Spring2017', N'D', 45, N'CS')
-- INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (200, 10, N'Spring2017', N'C', 0, N'CS')
-- INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (100, 10, N'Spring2017', N'A', 6, N'CS')
-- INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (300, 40, N'Spring2017', N'A', 6, N'CS')
-- INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (300, 40, N'Spring2016', N'A', 6, N'CS')
-- INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (200, 10, N'Spring2016', N'A', 0, N'CS')

-- go



-- create table Registration
-- (
-- Semester varchar(15) Foreign key References Semester(Semester),
-- RollNumber  varchar(7) Foreign key References Students(RollNo),
-- CourseID int Foreign key References Courses(CourseID), 
-- Section varchar(1),
-- GPA float
-- )
-- INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Fall2016', N'1', 20, N'A', 3.3)
-- INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Fall2016', N'2', 20, N'B', 4)
-- INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Spring2016', N'1', 30, N'A', 1.0)
-- INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Fall2016', N'6', 40, N'D',0.0)
-- INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Spring2017', N'6', 40, N'D',1)


-- go

-- Create table ChallanForm
-- (Semester varchar(15) Foreign key References Semester(Semester),
-- RollNumber  varchar(7) Foreign key References Students(RollNo),
-- TotalDues int,
-- [Status] varchar(10)
-- )
-- GO
-- INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'1', 100000, N'Paid')
-- INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'2', 13333, N'Paid')
-- INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'3', 5000, N'Paid')
-- INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'4', 20000, N'Pending')


-- TRIGGER 1
CREATE TRIGGER PreventDeleteStudent
ON Students
INSTEAD OF DELETE
AS BEGIN
PRINT 'You dont have the permission to delete the student'
END;


-- TRIGGER 2
CREATE TRIGGER PreventInsertCourse
ON Courses
INSTEAD OF INSERT
AS BEGIN
PRINT 'You dont have the permission to Insert a new Course'
END;


-- TRIGGER 3
CREATE TABLE Notify
(
    NotificationID int Primary key,
    StudentID varchar(7) Foreign key References Students(RollNo),
    NotificationString varchar(100)
);

CREATE TRIGGER NotifyStudent
ON Registration
AFTER INSERT
AS

BEGIN
    DECLARE @RollNo varchar(7);
    DECLARE @CourseID int;
    DECLARE @Semester varchar(15);
    DECLARE @Section varchar(1);
    DECLARE @GPA float;
    DECLARE @AvailableSeats int;
    DECLARE @PrerequiteCourseID int;
    DECLARE @PassedPrerequite bit;
    DECLARE @NotificationString varchar(100);
    DECLARE @NotificationID int;

    SELECT @RollNo = RollNumber, @CourseID = CourseID, @Semester = Semester, @Section = Section, @GPA = GPA
    FROM inserted;

    SELECT @AvailableSeats = AvailableSeats, @PrerequiteCourseID = PrerequiteCourseID
    FROM Courses_Semester
    WHERE CourseID = @CourseID AND Semester = @Semester AND Section = @Section;

    IF @GPA >= 2.0 AND @AvailableSeats > 0
    BEGIN
        IF @PrerequiteCourseID IS NULL
        BEGIN
            SET @NotificationString = 'Registration Successful';
        END
        ELSE
        BEGIN
            SELECT @PassedPrerequite = 1
            FROM Registration
            WHERE RollNumber = @RollNo AND CourseID = @PrerequiteCourseID;

            IF @PassedPrerequite = 1
            BEGIN
                SET @NotificationString = 'Registration Successful';
            END
            ELSE
            BEGIN
                SET @NotificationString = 'Registration Failed. You have not passed the prerequisite course';
            END
        END
    END
    ELSE
    BEGIN
        SET @NotificationString = 'Registration Failed. Either you have not passed the prerequisite course or there are no available seats';
    END

    INSERT INTO Notify (StudentID, NotificationString)
    VALUES (@RollNo, @NotificationString);
END;


-- TRIGGER 4
CREATE TRIGGER PreventEnroll
ON Registration
AFTER INSERT
AS BEGIN
    DECLARE @RollNo varchar(7);
    DECLARE @TotalDues int;
    DECLARE @NotificationString varchar(100);
    DECLARE @NotificationID int;

    SELECT @RollNo = RollNumber, @TotalDues = TotalDues
    FROM ChallanForm
    WHERE RollNumber = (SELECT RollNumber FROM inserted);

    IF @TotalDues > 20000
    BEGIN
        PRINT 'Registration Failed. You have more than 20,000 dues';
    END
    ELSE
    BEGIN
        PRINT 'Registration Successful';
    END
END;

-- TRIGGER 5
CREATE TRIGGER PreventDeleteCourseSemester
ON Courses_Semester
INSTEAD OF DELETE
AS BEGIN
    DECLARE @AvailableSeats int;
    DECLARE @CourseID int;
    DECLARE @Semester varchar(15);
    DECLARE @Section varchar(1);

    SELECT @AvailableSeats = AvailableSeats
    FROM deleted;

    IF @AvailableSeats < 10
    BEGIN
        PRINT 'Not possible';
    END
    ELSE
    BEGIN
        DELETE FROM Courses_Semester
        WHERE CourseID = (SELECT CourseID FROM deleted) AND Semester = (SELECT Semester FROM deleted) AND Section = (SELECT Section FROM deleted);
        PRINT 'Successfully deleted';
    END
END;


-- TRIGGER 6
CREATE TRIGGER PreventInstructorModification
ON Instructors
INSTEAD OF INSERT, UPDATE, DELETE
AS BEGIN
    PRINT 'You dont have the permission to modify the Instructors table';
END;

