use techshop;
-- 1. Write an SQL query to retrieve the names and emails of all customers. 
select concat(Firstname,' ',Lastname) as names ,email from customers;
-- 2. Write an SQL query to list all orders with their order dates and corresponding customer names.

select o.orderid,o.orderdate,concat(c.Firstname,' ',c.Lastname) as customernames from orders o inner join customers c on o.customerid=c.customerid;

-- 3. Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.
select * from customers;
insert into customers(customerid,firstname,lastname,email,phone,address) values(11,'Madhu','Thangavel','madhu@gmail.com',9888999999,'255 mullai st');
-- 4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.
update products set price =price*1.1 ;
select * from products;
-- 5. Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.
select * from orders;
select * from orderdetails;
delete from orders where orderid=3;

-- 6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.
select * from orders;
insert into orders(orderid,customerid,orderdate,totalamount) values(12,1,'2024-05-01',5000);
-- 7. Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information.
select * from customers;
UPDATE Customers
SET email = 'johndoe@gmail.com',
    address = '12th cross st'
WHERE customerid = 1;
-- 8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table.
select * from orders;
select * from orderdetails;
select od.orderid,od.quantity,p.productid,p.productname,sum(p.price*od.quantity) as totalcost 
from orderdetails od 
inner join products p on od.productid =p.productid 
group by od.orderid,od.quantity,p.productid,p.productname;
-- 9. Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.
delete from orders where customerid=9;

-- 10. Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details.
select * from products;
insert into products(productid,productname,description,price) values (11,'speakers','loud bass speakers',2000);
-- 11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from  "Pending" to "Shipped"). Allow users to input the order ID and the new status.
ALTER TABLE orders
ADD COLUMN status VARCHAR(20) DEFAULT 'Pending';
select * from orders;
UPDATE orders
SET status = 'Shipped'
WHERE orderid = 1;
-- 12. Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table.
select customerid,count(orderid) as numberoforders from orders group by customerid;
