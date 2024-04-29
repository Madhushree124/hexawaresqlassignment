create database HMBank;
use HMBank;

drop table customers;
create table customers(
customer_id int,
first_name varchar(30),
last_name varchar(30),
DOB date,
email varchar(40),
phone_number varchar(15),
 address VARCHAR(100),
primary key(customer_id));

drop table accounts;
create table accounts(
account_id int,
customer_id int,
account_type varchar(30),
balance decimal(9,2),
primary key(account_id),
foreign key(customer_id) references customers(customer_id) on delete cascade);

drop table transactions;
create table transactions(
transaction_id int,
account_id int,
transaction_type varchar(30),
amount decimal(9,2),
transaction_date date,
primary key(transaction_id),
foreign key(account_id) references accounts(account_id) on delete cascade);

delete from customers;
INSERT INTO customers (customer_id, first_name, last_name, DOB, email, phone_number, address) VALUES
(1, 'madhushree', 't', '1990-05-15', 'madhu@example.com', '6789067890', '123 Main St, california, USA'),
(2, 'hareesh', 'dl', '1985-08-20', 'hareesh@example.com', '8908908908', '456 Elm St, california, USA'),
(3, 'Alice', 'Johnson', '1992-02-10', 'alice.johnson@example.com', '7890789078', '789 Oak St, san francisco, USA'),
(4, 'Bob', 'Brown', '1988-11-30', 'bob.brown@example.com', '5678567878', '456 Maple St, san francisco, USA'),
(5, 'Emily', 'Davis', '1995-04-25', 'emily.davis@example.com', '9090909090', '789 Pine St, New york, USA'),
(6, 'Michael', 'Wilson', '1989-09-18', 'michael.wilson@example.com', '7779995555', '123 Cedar St, california, USA'),
(7, 'Samantha', 'Martinez', '1993-06-12', 'samantha.martinez@example.com', '4446668888', '456 Birch St, Anytown, USA'),
(8, 'David', 'Anderson', '1991-03-08', 'david.anderson@example.com', '2223334444', '789 Pine St, New york, USA'),
(9, 'Shanthi', 't', '1994-07-22', 'shanthit@example.com', '6665554444', '123 Elm St, New york, USA'),
(10, 'Daniel', 'Taylor', '1996-01-05', 'daniel.taylor@example.com', '1237894561', '456 Oak St, Anytown, USA');

delete from accounts;
INSERT INTO accounts (account_id, customer_id, account_type, balance) VALUES
(101, 1, 'savings', 5000.00),
(102, 2, 'current', 2500.00),
(103, 3, 'savings', 10000.00),
(104, 4, 'zero_balance', 0.00),
(105, 5, 'savings', 7500.00),
(106, 6, 'current', 3500.00),
(107, 7, 'savings', 6000.00),
(108, 8, 'current', 4200.00),
(109, 9, 'savings', 8000.00),
(110, 10, 'savings', 9000.00);

delete from transactions;
INSERT INTO transactions (transaction_id, account_id, transaction_type, amount, transaction_date) VALUES
(201, 101, 'deposit', 1000.00, '2024-04-01'),
(202, 101, 'withdrawal', 500.00, '2024-04-03'),
(203, 102, 'deposit', 1500.00, '2024-04-05'),
(204, 103, 'withdrawal', 2000.00, '2024-04-06'),
(205, 104, 'deposit', 500.00, '2024-04-10'),
(206, 105, 'withdrawal', 1000.00, '2024-04-12'),
(207, 106, 'deposit', 2000.00, '2024-04-15'),
(208, 107, 'withdrawal', 1500.00, '2024-04-18'),
(209, 108, 'deposit', 2500.00, '2024-04-01'),
(210, 109, 'withdrawal', 3000.00, '2024-04-01'),
(211, 110, 'deposit', 3500.00, '2024-04-28');