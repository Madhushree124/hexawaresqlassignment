-- Write a SQL query to retrieve the name, account type and email of all customers. 
use hmbank;
select * from accounts;
select c.first_name,c.last_name,a.account_type,c.email from customers c inner join accounts a on c.customer_id=a.customer_id ;
-- 2. Write a SQL query to list all transaction corresponding customer.
select * from customers;
select * from transactions;
select c.customer_id,c.first_name,c.last_name,t.transaction_id,a.account_id,t.transaction_type ,t.amount,t.transaction_date 
from transactions t
inner join accounts a on t.account_id=a.account_id 
inner join customers c on a.customer_id=c.customer_id;

-- 3. Write a SQL query to increase the balance of a specific account by a certain amount.
update accounts set balance=6000 where account_id=101;
-- 4. Write a SQL query to Combine first and last names of customers as a full_name.
select concat(first_name,' ',last_name) as fullname from customers;

-- 5. Write a SQL query to remove accounts with a balance of zero where the account type is savings.
DELETE FROM accounts
WHERE balance = 0.00 AND account_type = 'savings';
rollback;

-- 6. Write a SQL query to Find customers living in a specific city.
select * from customers where address like ('%oak st%');
-- 7. Write a SQL query to Get the account balance for a specific account.
select balance from accounts where account_id=105;
-- 8. Write a SQL query to List all current accounts with a balance greater than $1,000.
select * from accounts where account_type='current'and balance>1000;
-- 9. Write a SQL query to Retrieve all transactions for a specific account.
select * from transactions where account_id=101;

-- 10. Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate.
SELECT 
    account_id,
    balance AS original_balance,
    (balance * 10 / 100) AS interest_accrued
FROM 
    accounts
WHERE 
    account_type = 'savings';
-- 11. Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit.
select account_id,balance from accounts where balance < 1000;
-- 12. Write a SQL query to Find customers not living in a specific city
select * from customers where address not like('%new york%');