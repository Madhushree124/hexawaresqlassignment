-- 1. Write an SQL query to find out which customers have not placed any orders.
use techshop;
select* from orders;
select c.customerid,concat(c.firstname,' ',c.lastname) as customername,o.orderid 
from customers c 
left join orders o on c.customerid=o.customerid 
where orderid is null;
-- 2. Write an SQL query to find the total number of products available for sale. 
select productid,quantityinstock from inventory;
-- 3. Write an SQL query to calculate the total revenue generated by TechShop. 
SELECT SUM(od.quantity * p.price) AS TotalRevenue
FROM orders o
INNER JOIN orderdetails od ON o.orderid = od.orderid
INNER JOIN products p ON od.productid = p.productid;
-- 4. Write an SQL query to calculate the average quantity ordered for products in a specific category. Allow users to input the category name as a parameter.
select * from orderdetails;
select * from products;
select avg(od.quantity) as avgquantity,p.productname from orderdetails od inner join products p on od.productid=p.productid where category='portable electronics' group by p.productname;
-- 5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter.
SELECT SUM(od.quantity * p.price) AS TotalRevenue
FROM orders o
INNER JOIN orderdetails od ON o.orderid = od.orderid
INNER JOIN products p ON od.productid = p.productid where customerid=7;
-- 6. Write an SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed.
select * from orders;
select count(o.orderid),o.customerid,concat(c.firstname,' ',c.lastname) as customername from orders o 
inner join customers c on o.customerid=c.customerid group by o.customerid ;
-- 7. Write an SQL query to find the most popular product category, which is the one with the highest total quantity ordered across all orders.
SELECT
    p.category AS Category,
    SUM(od.quantity) AS TotalQuantityOrdered
FROM
    orderdetails od
INNER JOIN
    products p ON od.productid = p.productid
GROUP BY
    p.category
ORDER BY
    TotalQuantityOrdered DESC
limit 1;

-- 8. Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. List their name and total spending.
select o.orderid,concat(c.firstname,' ',c.lastname) as customername,sum(od.quantity *p.price) as totalrevenue 
from orders o 
inner join customers c on o.customerid=c.customerid 
inner join orderdetails od on o.orderid=od.orderid
inner join products p on od.productid=p.productid
group by o.orderid,c.firstname,c.lastname,od.quantity,p.price
 order by totalrevenue desc limit 1 ;
-- 9. Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers.
SELECT
    AVG(total_revenue) AS AverageOrderValue
FROM
    (SELECT
        o.customerid,
        SUM(od.quantity * p.price) AS total_revenue,
        COUNT(o.orderid) AS num_orders
    FROM
        orders o
    INNER JOIN
        orderdetails od ON o.orderid = od.orderid
    INNER JOIN
        products p ON od.productid = p.productid
    GROUP BY
        o.customerid) AS revenue_orders;

-- 10. Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count.
select * from orders;
select count(o.orderid),o.customerid,concat(c.firstname,' ',c.lastname) as customername from orders o 
inner join customers c on o.customerid=c.customerid group by o.customerid ;