CREATE DATABASE SchoolDB;

USE SchoolDB;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    grade INT
);



CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);


CREATE TABLE Classrooms (
    classroom_id INT PRIMARY KEY,
    room_number VARCHAR(10),
    capacity INT
);



CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    course_code VARCHAR(20),
    schedule VARCHAR(50),
    teacher_id INT,
    classroom_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id),
    FOREIGN KEY (classroom_id) REFERENCES Classrooms(classroom_id)
);






CREATE TABLE Student_Courses (
    registration_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);





INSERT INTO Students VALUES
(1, 'Ali', 'Hassan', 10),
(2, 'Sara', 'Mohamed', 11),
(3, 'Omar', 'Khaled', 10),
(4, 'Nour', 'Ahmed', 12),
(5, 'Mona', 'Youssef', 11),
(6, 'Youssef', 'Ali', 10),
(7, 'Laila', 'Samir', 12),
(8, 'Hassan', 'Mostafa', 11),
(9, 'Nada', 'Fathy', 10),
(10, 'Karim', 'Saeed', 12);

INSERT INTO Teachers VALUES
(1, 'Ahmed', 'Samir'),
(2, 'Laila', 'Mostafa'),
(3, 'Hossam', 'Fathy'),
(4, 'Maged', 'Adel'),
(5, 'Salma', 'Nabil');




INSERT INTO Classrooms VALUES
(1, 'A101', 30),
(2, 'B202', 25),
(3, 'C303', 40),
(4, 'D404', 35),
(5, 'E505', 20);





INSERT INTO Courses VALUES
(1, 'Mathematics', 'MATH101', 'Sun 9-11', 1, 1),
(2, 'Physics', 'PHY201', 'Mon 10-12', 2, 2),
(3, 'Chemistry', 'CHEM301', 'Tue 8-10', 3, 3),
(4, 'English', 'ENG101', 'Wed 11-1', 1, 4),
(5, 'Biology', 'BIO201', 'Thu 9-11', 4, 3),
(6, 'History', 'HIS101', 'Sun 12-2', 5, 5),
(7, 'Computer Science', 'CS101', 'Mon 1-3', 4, 1);





INSERT INTO Student_Courses VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 7),
(4, 2, 1),
(5, 2, 4),
(6, 2, 6),
(7, 3, 2),
(8, 3, 3),
(9, 4, 1),
(10, 4, 5),
(11, 5, 4),
(12, 5, 6),
(13, 6, 1),
(14, 6, 7),
(15, 7, 3),
(16, 7, 5),
(17, 8, 2),
(18, 9, 1);






