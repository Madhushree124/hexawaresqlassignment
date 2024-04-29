create database SIS;
use SIS;

create table students(
student_id int,
first_name varchar(30),
last_name varchar(30),
date_of_birth date,
email varchar(40),
phone_number varchar(15),
primary key(student_id));

create table teacher(
teacher_id int,
first_name varchar(30),
last_name varchar(30),
email varchar(40),
primary key(teacher_id));

create table courses(
course_id int,
course_name varchar(30),
credits int,
teacher_id int,
primary key(course_id),
foreign key(teacher_id) references teacher(teacher_id)
);

create table enrollments(
enrollment_id int,
student_id int,
course_id int,
enrollment_date date,
primary key(enrollment_id),
foreign key(student_id) references students(student_id),
foreign key(course_id) references courses(course_id));

create table payments(
payment_id int,
student_id int,
amount decimal(9,2),
payment_date date,
primary key(payment_id),
foreign key(student_id) references students(student_id));

INSERT INTO students (student_id, first_name, last_name, date_of_birth, email, phone_number) VALUES
(1, 'John', 'Doe', '2000-05-15', 'john.doe@example.com', '9999337784'),
(2, 'Jane', 'Smith', '2001-08-20', 'jane.smith@example.com', '9898989822'),
(3, 'Alice', 'Johnson', '1999-02-10', 'alice.johnson@example.com', '8989894444'),
(4, 'Bob', 'Brown', '2002-11-30', 'bob.brown@example.com', '7897896788'),
(5, 'Emily', 'Davis', '2003-04-25', 'emily.davis@example.com', '9089089089'),
(6, 'Michael', 'Wilson', '2000-09-18', 'michael.wilson@example.com', '7890789090'),
(7, 'Samantha', 'Martinez', '2001-06-12', 'samantha.martinez@example.com', '5678956789'),
(8, 'David', 'Anderson', '2002-03-08', 'david.anderson@example.com', '8908908908'),
(9, 'Olivia', 'Garcia', '2000-07-22', 'olivia.garcia@example.com', '6789678967'),
(10, 'Daniel', 'Taylor', '2003-01-05', 'daniel.taylor@example.com', '3456345634'),
(11, 'Sophia', 'Clark', '2002-10-11', 'sophia.clark@example.com', '9090908920'),
(12, 'Ethan', 'White', '2001-12-28', 'ethan.white@example.com', '5675678908');

INSERT INTO teacher (teacher_id, first_name, last_name, email) VALUES
(101, 'Michael', 'Johnson', 'michael.johnson@gmail.com'),
(102, 'Emily', 'Brown', 'emily.brown@gmail.com'),
(103, 'Christopher', 'Davis', 'christopher.davis@gmail.com'),
(104, 'Madhu', 'thangavel', 'madhu@gmail.com'),
(105, 'Shanthi', 'M', 'shanthi@gmail.com'),
(106, 'guna', 't', 'gunat@gmail.com');

INSERT INTO courses (course_id, course_name, credits, teacher_id) VALUES
(201, 'Mathematics', 4, 101),
(202, 'English Literature', 3, 102),
(203, 'Computer Science', 5, 103),
(204, 'History', 3, 104),
(205, 'Biology', 4, 105),
(206, 'Chemistry', 4, 106);

INSERT INTO enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(301, 1, 201, '2023-09-01'),
(302, 2, 202, '2023-09-02'),
(303, 3, 203, '2023-09-03'),
(304, 4, 204, '2023-09-04'),
(305, 5, 205, '2023-09-05'),
(306, 6, 206, '2023-09-06'),
(307, 7, 201, '2023-09-01'),
(308, 8, 202, '2023-09-08'),
(309, 9, 203, '2023-09-02'),
(310, 10, 204, '2023-09-10'),
(311, 11, 205, '2023-09-04'),
(312, 12, 206, '2023-09-03');

INSERT INTO payments (payment_id, student_id, amount, payment_date) VALUES
(401, 1, 5000.00, '2023-09-15'),
(402, 2, 6000.00, '2023-09-16'),
(403, 3, 5500.00, '2023-09-17'),
(404, 4, 7000.00, '2023-09-18'),
(405, 5, 7500.00, '2023-09-19'),
(406, 6, 6500.00, '2023-09-20'),
(407, 7, 5000.00, '2023-09-21'),
(408, 8, 6000.00, '2023-09-22'),
(409, 9, 5500.00, '2023-09-16'),
(410, 10, 7000.00, '2023-09-24'),
(411, 11, 7500.00, '2023-09-18'),
(412, 12, 6500.00, '2023-09-17');