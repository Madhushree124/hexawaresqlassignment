-- 1. Write a SQL query to Find the average account balance for all customers. 
use hmbank;
select * from accounts;
select customer_id,avg(balance) from accounts group by customer_id;

-- 2. Write a SQL query to Retrieve the top 10 highest account balances.
select balance from accounts order by balance desc limit 10;

-- 3. Write a SQL query to Calculate Total Deposits for All Customers in specific date.
select * from transactions;
select transaction_type,sum(amount) from transactions where transaction_type='deposit' and transaction_date='2024-04-01' group by transaction_type;

-- 4. Write a SQL query to Find the Oldest and Newest Customers.
select * from customers;
select * from accounts;
select 'oldest' as customer_type,customer_id,first_name,last_name,dob from customers 
where dob=(select min(dob) from customers)
union select 'newest' as customer_type,customer_id,first_name,last_name,dob from customers
 where dob=(select max(dob) from customers) ;

-- 5. Write a SQL query to Retrieve transaction details along with the account type.
select a.account_id,a.account_type,t.transaction_id,t.transaction_type,amount,transaction_type 
from accounts a inner join transactions t on a.account_id=t.account_id;

-- 6. Write a SQL query to Get a list of customers along with their account details.
select c.customer_id,concat(first_name,' ',last_name) as customername,a.account_id,a.account_type,a.balance from  accounts a inner join customers c on a.customer_id=c.customer_id;

-- 7. Write a SQL query to Retrieve transaction details along with customer information for a specific account.
select c.customer_id,c.first_name,c.last_name,t.transaction_id,a.account_id,t.transaction_type ,t.amount,t.transaction_date 
from transactions t
inner join accounts a on t.account_id=a.account_id 
inner join customers c on a.customer_id=c.customer_id where a.account_id=101;

-- 8. Write a SQL query to Identify customers who have more than one account. 
INSERT INTO accounts (account_id, customer_id, account_type, balance) VALUES
(111, 1, 'current', 1000.00);
select c.customer_id,c.first_name,c.last_name,count(c.customer_id) as noofaccounts from customers c
inner join accounts a on c.customer_id=a.customer_id group by c.customer_id having noofaccounts >1;

-- 9. Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals.

SELECT (SELECT SUM(amount) FROM transactions WHERE transaction_type = 'deposit') -
    (SELECT SUM(amount) FROM transactions WHERE transaction_type = 'withdrawal') AS difference;

-- 10. Write a SQL query to Calculate the average daily balance for each account over a specified period.

-- 11. Calculate the total balance for each account type.
select account_type,sum(balance) as total_balance from accounts group by account_type;
-- 12. Identify accounts with the highest number of transactions order by descending order.
select account_id,count(account_id) as no_of_transactions from transactions group by account_id order by no_of_transactions desc ;

-- 13. List customers with high aggregate account balances, along with their account types.

-- 14. Identify and list duplicate transactions based on transaction amount, date, and account.