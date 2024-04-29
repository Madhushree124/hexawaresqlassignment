create database Techshop;

use techshop;

create table customers(
customerid int,
Firstname varchar(30),
Lastname varchar(30),
email varchar(30),
phone varchar(15),
address varchar(50),
primary key(customerid)
);

create table products(
productid int,
productname varchar(30),
description varchar(30),
price decimal(8,2),
primary key(productid));

create table orders(
orderid int,
customerid int,
orderdate datetime,
totalamount decimal(8,2),
primary key(orderid),
foreign key(customerid) references customers(customerid)
);

create table orderdetails(
orderdetailid int,
orderid int,
productid int,
quantity int,
primary key(orderdetailid),
foreign key(orderid) references orders(orderid),
foreign key(productid) references products(productid)
);

create table inventory(
inventoryid int,
productid int,
quantityinstock int,
laststockupdate datetime,
primary key(inventoryid),
foreign key(productid) references products(productid) );

INSERT INTO customers (customerid, Firstname, Lastname, email, phone, address) VALUES
(1, 'John', 'Doe', 'john@example.com', '1234567890', '123 Main St'),
(2, 'Jane', 'Smith', 'jane@example.com', '9876543210', '456 Elm St'),
(3, 'Alice', 'Johnson', 'alice@example.com', '5551234567', '789 Oak St'),
(4, 'Bob', 'Williams', 'bob@example.com', '4447891234', '101 Pine St'),
(5, 'Charlie', 'Brown', 'charlie@example.com', '3335557777', '246 Maple St'),
(6, 'Emily', 'Davis', 'emily@example.com', '2223334444', '369 Cedar St'),
(7, 'David', 'Wilson', 'david@example.com', '7778889999', '888 Walnut St'),
(8, 'Olivia', 'Martinez', 'olivia@example.com', '1112223333', '777 Birch St'),
(9, 'Sophia', 'Lopez', 'sophia@example.com', '9996663333', '963 Cherry St'),
(10, 'Michael', 'Garcia', 'michael@example.com', '1231231234', '369 Pineapple St');

INSERT INTO products (productid, productname, description, price) VALUES
(1, 'Laptop', 'High-performance laptop', 20000),
(2, 'Smartphone', 'Latest smartphone model', 5000),
(3, 'Tablet', 'Lightweight tablet', 8000),
(4, 'Headphones', 'Noise-cancelling headphones', 199),
(5, 'Monitor', '27" LED monitor', 2489.99),
(6, 'Keyboard', 'Mechanical gaming keyboard', 1049),
(7, 'Mouse', 'Wireless mouse', 300),
(8, 'Printer', 'Color laser printer', 2999),
(9, 'External Hard Drive', '1TB external hard drive', 600),
(10, 'Router', 'High-speed router', 129.99);

INSERT INTO orders (orderid, customerid, orderdate, totalamount) VALUES
(1, 1, '2024-04-20', 900),
(2, 2, '2024-04-21', 600),
(3, 3, '2024-04-22 ', 200),
(4, 4, '2024-04-23 ', 100),
(5, 5, '2024-04-24 ', 249),
(6, 6, '2024-04-25', 149),
(7, 7, '2024-04-26', 49),
(8, 8, '2024-04-27', 299),
(9, 9, '2024-04-28', 79),
(10, 10, '2024-04-29', 129);

INSERT INTO orderdetails (orderdetailid, orderid, productid, quantity) VALUES
(1, 1, 6, 1),
(2, 2, 4, 2),
(3, 3, 9, 1),
(4, 4, 2, 1),
(5, 5, 10, 2),
(6, 6, 1, 1),
(7, 7, 7, 4),
(8, 8, 8, 3),
(9, 9, 3, 6),
(10, 10, 5, 5);

INSERT INTO inventory (inventoryid, productid, quantityinstock, laststockupdate) VALUES
(1, 1, 10, '2024-04-20 10:30:00'),
(2, 2, 15, '2024-04-21 11:45:00'),
(3, 3, 20, '2024-04-22 09:15:00'),
(4, 4, 25, '2024-04-23 14:20:00'),
(5, 5, 30, '2024-04-24 13:00:00'),
(6, 6, 35, '2024-04-25 16:30:00'),
(7, 7, 40, '2024-04-26 10:00:00'),
(8, 8, 45, '2024-04-27 12:15:00'),
(9, 9, 50, '2024-04-28 11:00:00'),
(10, 10, 55, '2024-04-29 09:30:00');