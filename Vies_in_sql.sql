## CREATE OR REPLACE VIEW statement is used to modify an existing view. 

use bankingdb;

set sql_safe_updates=0;

show tables;
CREATE TABLE customerss(
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100),city VARCHAR(50),
  age INT,balance DECIMAL(12,2)
);

DESC CUSTOMERSS;

INSERT INTO customerss
(customer_id,customer_name,city,age,balance)
VALUES
(101, 'Rahul Sharma', 'Nagpur', 28, 45000.00),
(102, 'Priya patil', 'Pune', 32, 72000.00),
(103, 'Amit Verma', 'Mumbai', 25, 38000.00),
(104, 'Sneha Joshi', 'Nagpur', 30, 65000.00),
(105, 'Rohan Deshmukh', 'Pune', 35, 85000.00);

-- Display records
select *from customerss; ## Original Table or Base Table

create view citywise_highest_balance as 
select city, sum(balance)
from customerss
group by city order by sum(balance) desc;

select *from citywise_highest_balance;

desc citywise_highest_balance;

-- find views in mysql
show full tables where table_type = 'view';


create view customer_bal_gt_50000 as
select *
from customerss
where balance > 50000;

select *from customer_bal_gt_50000 where city = 'Nagpur';

select *from customer_bal_gt_50000;
 
delete from customer_bal_gt_50000 where city = 'Nagpur';

delete from customer_bal_gt_50000 where age = 35;

delete from customer_bal_gt_50000 where age = 32;

select *from customer_bal_gt_50000;

select *from customerss;

---- ORDER BY 
SELECT *
FROM customerss
ORDER BY balance desc;

---- GROUP BY
create view citywise_no_cust_view as
SELECT city, count(*) as total_customers
from customerss
group by city;

select *from citywise_no_cust_view;

---- modify the existing view
create or replace view citywise_no_cust_view as
SELECT city, AVG(balance) from customerss group by city;

select *from citywise_no_cust_view;

----- having 
SELECT city, AVG(balance) as avg_balance
from customerss
group by city
having avg(balance) > 40000;

select *from avg_gt_40000 where city = 'Pune';

create view premium_city_view as
SELECT city, sum(balance) as Total_balance
from customerss
group by city
having sum(balance) < 100000;

select *from premium_city_view;

---- Change in Existing view ----
create or replace view premium_city_view as
SELECT city, sum(balance) as Total_balance
from customerss
group by city
having sum(balance) < 100000 and city = 'Nagpur';


#create a simple View 
-- create view customer_view as
-- select
   -- customer_id,
   -- customer_name,
   -- city,
   -- balance
-- from customerss;

---- display Date from a view
select *from customer_view;

----- create a view with where
create view high_balance_customers as 
select
   customer_id,
   customer_name,
   balance,
   case
       when balance >= 50000 then 'High Balance'
       Else 'Low Balance'
	End as balance_status
from customerss;
select *from high_balance_customers;

--------- create a view with calculated columns
create view customer_balance_status as
select
   customer_id,
   customer_name,
   balance,
   case
       when balance >= 50000 then 'High Balance'
       Else 'Low Balance'
	End as balance_status
from customerss;

select *from customer_balance_status;

------- Banking Analysis with aggregate functions ----
create view banking_analysis_view as
select
   city,
   count(*) as 'Number of Customers',
   min(balance) as 'minimum Balance',
   Max(balance) as 'Maximum Balance',
   round(avg(balance),2)as 'Average balance',
   sum(balance) as 'Total Balance'
from customerss
group by city;

select *from banking_analysis_view;



