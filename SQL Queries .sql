		-- ✨ A. SELECT & WHERE ✨ --

 -- ♦️ Display all students:
SELECT * 
FROM 
	Students;

-- ♦️ Students who graed = 11:
SELECT * 
FROM 
	Students
where grade = 11;

-- ♦️ All Courses on Monday:
SELECT *
FROM 
	Courses
where schedule like 'Mon%';

-- ♦️ The capacity Grader than 30:
SELECT * 
FROM 
	Classrooms
where 
	capacity > 30;


		-- ✨ B. ORDER BY ✨ --

-- ♦️ Order Students By The Last Name:
SELECT * 
FROM 
	Students
ORDER BY last_name ASC;

-- ♦️ Order Courses By The course Name:
SELECT * 
FROM 
	Courses
ORDER BY course_name DESC;

-- ♦️ Order Classrooms By the Capacity:
SELECT * 
FROM 
	Classrooms
ORDER BY capacity DESC;


		-- ✨ C. JOINS ✨ --

-- ♦️ Join From Student table and Student_Courses:
SELECT 
	CONCAT(S.first_name,' ' ,S.last_name) AS FullName,
	SC.course_id
FROM 
	Students S
JOIN Student_Courses SC ON S.student_id = SC.student_id;

-- ♦️ Join From Teachers table and Courses:
SELECT 
	CONCAT(T.first_name,' ' ,T.last_name) AS Teacher_FullName,
	C.course_name
FROM 
	Courses C
JOIN Teachers T ON C.teacher_id = T. teacher_id;

-- ♦️ Join From Courses table and Classroon with the name:
SELECT 
	C.course_name, C_R.room_number
FROM 
	Courses C
JOIN Classrooms C_R ON C_R.classroom_id = C. classroom_id;

-- ♦️ Display the Names from the Teachers & Courses and students Tables:
SELECT 
	CONCAT(S.first_name,' ' ,S.last_name) AS FullName,
	CONCAT(T.first_name,' ' ,T.last_name) AS Teacher_FullName,
	C.course_name
FROM 
	Students S
JOIN Student_Courses SC ON S.student_id = SC.student_id
JOIN Courses C ON C.course_id = SC.course_id
JOIN Teachers T ON C.teacher_id = T.teacher_id;


		-- ✨ D. GROUP BY ✨ --

-- ♦️ Count Number of Students in each Course: 
SELECT 
	C.course_name,
    COUNT(SC.student_id) AS student_count
FROM 
	Courses C
JOIN Student_Courses SC ON C.course_id = SC.course_id
GROUP BY C.course_id, C.course_name;

-- ♦️ Show the Courses that Taught by each Teacher:
SELECT
	CONCAT(T.first_name,' ' ,T.last_name) AS Teacher_FullName,
    COUNT(C.course_id) AS courses_count
FROM 
	Teachers T
JOIN Courses C ON C.teacher_id =T.teacher_id
GROUP BY T.teacher_id, Teacher_FullName;

-- ♦️ Groub the Students BY the grade:
SELECT 
	grade,
    COUNT(S.student_id) AS students_count
FROM 
	Students S
GROUP BY
	grade;


		-- ✨ E. HAVING ✨ --

-- ♦️ Display the Courses that have more that 2 enrolled student:
SELECT 
	C.course_name, 
	COUNT(SC.student_id) AS Student_count
FROM 
	Courses C
JOIN Student_Courses SC ON C.course_id = SC.course_id
GROUP BY C.course_name, C.course_id
HAVING COUNT(SC.student_id) > 2;

-- ♦️ Display the teachers that teatch more than one Course:
SELECT 
	CONCAT(T.first_name,' ' ,T.last_name) AS Teacher_FullName,
    COUNT(C.course_id) AS Courses_count
FROM 
	Teachers T
JOIN Courses C ON T.teacher_id = C.teacher_id
GROUP BY T.teacher_id, Teacher_FullName
HAVING COUNT(C.course_id) > 1;

-- ♦️ The Courses with the Number of Students:
SELECT 
	C.course_name,
    COUNT(SC.student_id) AS Students_Count
FROM 
	Courses C
JOIN Student_Courses SC ON C.course_id = SC.course_id
GROUP BY C.course_id, C.course_name
ORDER BY Students_Count DESC;

-- ♦️ The Classroms that host more than one Course:
SELECT 
	CONCAT(T.first_name,' ' ,T.last_name) AS Teacher_FullName,
    COUNT(SC.student_id) AS Students_count
FROM 
	Teachers T
JOIN Courses C ON C.teacher_id = T.teacher_id
JOIN Student_Courses SC ON C.course_id = SC.course_id
GROUP BY T.teacher_id, Teacher_FullName 
HAVING COUNT(SC.student_id) > 3;


		-- ✨ G. Real Business Scenarios ✨ --

-- ♦️ The students whi aren't registerd in any Course:
SELECT
	CONCAT(S.first_name,' ' ,S.last_name) AS Student_FullName,
	S.student_id
FROM 
	Students S
JOIN Student_Courses SC ON S.student_id = SC.student_id
WHERE
	SC.student_id IS NULL;

-- ♦️ The most popular course:
SELECT 
    C.course_name,
    COUNT(SC.student_id) AS Total_students
FROM 
	Courses C
JOIN Student_Courses SC ON C.course_id = SC.course_id
GROUP BY C.course_id, C.course_name
ORDER BY Total_students DESC
LIMIT 1;

-- ♦️ The classroom with the highest student load:
SELECT 
    CL.room_number,
    COUNT(SC.student_id) AS Students_count
FROM 
	Classrooms CL
JOIN Courses C ON CL.classroom_id = C.classroom_id
JOIN Student_Courses SC ON C.course_id = SC.course_id
GROUP BY CL.classroom_id, CL.room_number
ORDER BY Students_count DESC
LIMIT 1;

-- ♦️ The Students registered in both Mathematics and English:
SELECT 
	CONCAT(S.first_name,' ' ,S.last_name) AS Student_FullName,
    S.student_id
FROM 
	Students S
JOIN Student_Courses SC ON S.student_id = SC.student_id
JOIN Courses C ON SC.course_id = C.course_id
WHERE 
	C.course_name IN ('Mathematics', 'English')
GROUP BY S.student_id, Student_FullName
HAVING COUNT(C.course_name) = 2;


			-- ✨ Thanks a Lot🌹 ✨ --
                  
				-- Amr Khaled --            
            