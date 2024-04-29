use sis;

-- 1 Write an SQL query to calculate the total payments made by a specific student. You will need to join the "Payments" table with the "Students" table based on the student's ID.
select * from  payments;

-- 2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.
select * from enrollments;
select * from courses;
select c.course_id ,c.course_name,count(e.student_id) as countofstudents from courses c inner join enrollments e on c.course_id=e.course_id group by c.course_id,c.course_name; 

-- 3. Write an SQL query to find the names of students who have not enrolled in any course. Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.
select* from students;
select s.student_id,concat(s.first_name,' ',s.last_name) as studentname,e.enrollment_id from students s left join enrollments e on s.student_id=e.student_id  where e.student_id is null;

-- 4. Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables.
select s.student_id,s.first_name,s.last_name,c.course_id,c.course_name,e.enrollment_id from students s inner join enrollments e on s.student_id=e.student_id inner join courses c on e.course_id=c.course_id;

-- 5. Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table.
select * from teacher;
select t.teacher_id,t.first_name,t.last_name,c.course_name from teacher t inner join courses c on t.teacher_id=c.teacher_id;

-- 6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students" table with the "Enrollments" and "Courses" tables.
select s.student_id,s.first_name,s.last_name,c.course_name,e.enrollment_id,e.enrollment_date
from students s 
inner join enrollments e on s.student_id=e.student_id 
inner join courses c on e.course_id=c.course_id where course_name='mathematics';

-- 7. Find the names of students who have not made any payments. Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records.
select * from payments;
select s.student_id,s.first_name,s.last_name from students s left join payments p on s.student_id=p.student_id where p.student_id is null;

-- 8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records.
insert into courses(course_id, course_name, credits, teacher_id) VALUES
(207, 'Java', 4, 106);
select c.course_name from courses c left join enrollments e on c.course_id=e.course_id where e.enrollment_id is null;

-- 9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" table to find students with multiple enrollment records.
INSERT INTO enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(313, 1, 202, '2023-09-01'),
(314, 2, 204, '2023-09-02');
select distinct e1.student_id,s.first_name,s.last_name 
from enrollments e1 
join enrollments e2 on e1.student_id=e2.student_id and e1.course_id<>e2.course_id   
join students s on e1.student_id =s.student_id;

-- 10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments.

select * from teacher;
INSERT INTO teacher (teacher_id, first_name, last_name, email) VALUES
(107, 'deepika', 'k', 'deepika@gmail.com');
select t.first_name,t.last_name from teacher t left join courses c on t.teacher_id=c.teacher_id where c.teacher_id is null;