-- 1. Retrieve the customer(s) with the highest account balance.
select * from accounts;
select c.customer_id,c.first_name,c.last_name from customers c inner join accounts a on c.customer_id=a.customer_id where a.balance=(select max(balance ) from accounts);
-- 2. Calculate the average account balance for customers who have more than one account.
select customer_id,avg(balance),count(customer_id) as no_of_accounts from accounts 
group by customer_id having no_of_accounts>1;

-- 3. Retrieve accounts with transactions whose amounts exceed the average transaction amount.
select * from customers;
select * from transactions;
select * from transactions where amount>(select avg(amount) from transactions) ;

-- 4. Identify customers who have no recorded transactions.
select * from accounts;
select c.customer_id,c.first_name,c.last_name from customers c 
left join accounts a on c.customer_id=a.customer_id 
left join transactions t on a.account_id=t.account_id where t.transaction_id is null;

-- 5. Calculate the total balance of accounts with no recorded transactions.
SELECT SUM(a.balance) AS total_balance
FROM accounts a
LEFT JOIN transactions t ON a.account_id = t.account_id
WHERE t.transaction_id IS NULL;

-- 6. Retrieve transactions for accounts with the lowest balance.
select a.account_id,t.transaction_id,t.amount,t.transaction_date from transactions t inner join accounts a on t.account_id=a.account_id
where a.balance=(select min(balance) from accounts);

-- 7. Identify customers who have accounts of multiple types.
select * from accounts;
select c.customer_id,c.first_name,c.last_name from customers c inner join accounts a on c.customer_id=a.customer_id 
group by c.customer_id,c.first_name,c.last_name
having count(distinct a.account_type)>1;

-- 8. Calculate the percentage of each account type out of the total number of accounts.

select account_type, count(*) * 100.0 / (select count(*) from Accounts) as percentage

from Accounts group by account_type;

-- 9. Retrieve all transactions for a customer with a given customer_id.
select c.customer_id,t.transaction_id,t.account_id,t.transaction_type,t.amount,t.transaction_date from transactions t
inner join accounts a on t.account_id=a.account_id inner join customers c on a.customer_id=c.customer_id where c.customer_id=1;

-- 10. Calculate the total balance for each account type, including a subquery within the SELECT clause