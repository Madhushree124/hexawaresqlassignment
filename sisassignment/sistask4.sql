-- 1. Write an SQL query to calculate the average number of students enrolled in each course. Use aggregate functions and subqueries to achieve this.
use sis;
select * from courses;
select * from enrollments;
SELECT c.course_id,c.course_name,AVG(enrollment_count) AS average_students_enrolled FROM courses c LEFT JOIN 
    (SELECT course_id, COUNT(student_id) AS enrollment_count
     FROM enrollments GROUP BY course_id) AS enroll_counts
ON c.course_id = enroll_counts.course_id
GROUP BY c.course_id, c.course_name;

-- 2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount.
select * from students;
select * from payments;
select s.first_name,s.last_name,p.student_id,max(p.amount) as highestamount from students s 
inner join payments p on s.student_id=p.student_id group by p. student_id order by highestamount desc limit 1;

-- 3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the course(s) with the maximum enrollment count.
select c.course_id,c.course_name,count(enrollment_id) noofenrollments from courses c 
inner join enrollments e on c.course_id=e.course_id group by course_id order by noofenrollments desc limit 1;

-- 4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses.
select * from teacher;
select * from payments;
select t.teacher_id,t.first_name,t.last_name ,sum(p.amount) from teacher t 
left join courses c on t.teacher_id=c.teacher_id left join enrollments e on c.course_id=e.course_id
left join payments p on e.student_id=p.student_id group by t.teacher_id,t.first_name,t.last_name;

-- 5. Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses.

-- 6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments.
select t.first_name,t.last_name from teacher t left join courses c on t.teacher_id=c.teacher_id where c.teacher_id is null;

-- 7. Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth.
SELECT AVG(student_age) AS average_age
FROM (
    SELECT TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS student_age
    FROM students
) AS age_subquery;
-- 8. Identify courses with no enrollments. Use subqueries to find courses without enrollment records.
select * from courses;
select * from enrollments;
select c.course_id,c.course_name from courses c left join enrollments e on c.course_id=e.course_id where e.enrollment_id is null;

-- 9. Calculate the total payments made by each student for each course they are enrolled in. Use subqueries and aggregate functions to sum payments.
select * from payments;
select e.student_id,e.course_id,sum(p.amount) from enrollments e inner join payments p on e.student_id=p.student_id group by e.student_id,e.course_id;

-- 10. Identify students who have made more than one payment. Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than one.
insert into payments(payment_id, student_id, amount, payment_date) VALUES
(413, 1, 4000.00, '2023-09-15');
select * from payments;
select s.first_name,s.last_name,p.student_id,count(p.payment_id) as paymentcount from students s 
inner join payments p on s.student_id=p.student_id  group by p. student_id having paymentcount>1 ;

-- 11. Write an SQL query to calculate the total payments made by each student. Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.
select s.student_id,s.first_name,s.last_name ,sum(p.amount) as totalpayment from students s inner join payments p on s.student_id=p.student_id group by s.student_id;

-- 12. Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.
select c.course_id,c.course_name ,count(e.enrollment_id) as count_of_students from courses c inner join enrollments e on c.course_id=e.course_id group by c.course_id;

-- 13. Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average
SELECT avg(amount) as averagepayment from payments;