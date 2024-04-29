use sis;

-- 1. Write an SQL query to insert a new student into the "Students" table with the following details:


select * from students;

insert into students (student_id, first_name, last_name, date_of_birth, email, phone_number) 
VALUES (13,'John','Doe','1995-08-15','john.doe@example.com','1234567890');
-- 2. Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date.
select * from students;
select * from courses;
select * from enrollments;
insert into enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(313,13,204,2023-09-14);
-- 3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address.
select * from teacher;
update teacher set email='michaeljohn@gmail.com' where teacher_id=101;
-- 4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on the student and course.
select * from enrollments;
delete from enrollments where student_id=12 and course_id=206;
-- 5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables.
update courses set teacher_id=102 where course_name='English Literature';
-- 6. Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity.
DELETE FROM students WHERE student_id = 3;
rollback;
-- 7. Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount
select * from payments;
update payments set amount ='6000' where payment_id=409;