use n325_db;

CREATE TABLE customers(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
city VARCHAR(50)
);

INSERT INTO customers
VALUES
(101, 'Amit', 'Nagpur'),
(102, 'Priya', 'Pune'),
(103, 'Rahul', 'Mumbai'),
(104, 'Sneha', 'Delhi'),
(105, 'Vikas', 'Nashik');

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
product VARCHAR(50),
amount DECIMAL(10,2)
);

INSERT INTO orders
VALUES
(1, 101, 'Laptop', 55000), (2, 102, 'Mobile', 25000), (3, 101, 'Mouse', 1500), (4, 103, 'Keyboard', 3000),
(5, 102, 'Monitor', 12000), (6, 106, 'Priter', 18000);

select *from customers;
select *from orders;

## INNER JOINS: INNER JOIN returns only the record that have matching values in both tables. 

select x.*,y.*
from customers as x
inner join orders as y
on x.customer_id = y.customer_id;

select x.*,y.*
from customers as x
inner join orders as y
on x.customer_id = y.customer_id;

select
  customers.customer_id,
  customers.customer_name,
  orders.product,
  orders.amount
from customers
inner join orders
on customers.customer_id = orders.customer_id;

-- JOIN with table Aliases
SELECT
  c.customer_id,
  c.customer_name,
  o.product,
  o.amount
from customers as c
inner join orders as o
on c.customer_id = o.customer_id;

## left joins
-- left joins returns
-- 1) All records from the left table
-- 2) Maching records from the right table
-- 3) If there is no match, NULL is returned.
-- 4) LEFT JOINS--> Left table is important. 
select
  c.customer_id,
  c.customer_name,
  o.product,
  o.amount
from customers c
left join orders o 
on c.customer_id = o.customer_id;

## RIGHT JOINS
-- RIGHT JOIN returns:
-- 1) All records from the right table
-- 2) Maching records from the left table
-- 3) NULL when there is no match. 
-- 4) right JOINS--> right table is important. 
select
  c.customer_id,
  c.customer_name,
  o.product,
  o.amount
from customers c
right join orders o 
on c.customer_id = o.customer_id;

## CROSS JOINS/CARTESIAN JOIN
-- CROSS JOIN produced the Cartesian product of two tables. 
-- If:
-- Table A has 5 rows --
-- Table B has 6 rows --
-- It will generate 5 rows * 6 rows = 30 rows --
-- CROSS JOINS will generate a very large number of rows. --
select
c.*,
o.*
from customers c
CROSS JOIN orders o;

## SELF JOIN :
-- 1) A SELF JOIN means joining a table with itself.
-- 2) It is useful when records within the same table have relationship with each other.


CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(50),
  manager_id INT 
);

INSERT INTO employees
VALUES
(1, 'Amit', NULL),
(2, 'Priya', 1),
(3, 'Rahul', 1),
(4, 'Sneha', 2),
(5, 'Rocky', 3); 


SELECT
  e.employee_name as Employee,
  m.employee_name as Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id =m.employee_id;

show tables;

select *from customers;
----------------- SELF JOIN -------------------------- 
create table employee_new(
emp_id int primary key, emp_name varchar(50), department varchar(100)
);

desc employee_new;

insert into employee_new values
(1, 'Rahul', 'IT'), (2, 'Priya', 'HR'), (3, 'Hitesh', 'IT'), (5, 'Amit','Finance');

select *from employee_new;

select e_n1.emp_name, e_n2.emp_name,e_n1.department
from employee_new e_n1
join employee_new e_n2
on e_n1.department = e_n2.department;

## FULL OUTER JOINS: MySQL does not directly support, but we can make full outer join by union of LEFT JOIN & RIGHT JOIN.-- 
-- This will give records from both tables, including unmached records. --
-- Full Join or Full Outer Join: It will return matching and non-matching rows from both tables. --
SELECT
 c.customer_id,
 c.customer_name,
 o.order_id,
 o.product
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

SELECT
 c.customer_id,
 c.customer_name,
 o.order_id,
 o.product
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

SELECT
 c.customer_id,
 c.customer_name,
 o.order_id,
 o.product
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

SELECT
 c.customer_id,
 c.customer_name,
 o.order_id,
 o.product
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id

UNION

SELECT
 c.customer_id,
 c.customer_name,
 o.order_id,
 o.product
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

## JOINS WITH WHERE clause.
SELECT
 c.*,
 o.product,
 o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.amount>12000;

SELECT
c.*,sum(o.amount),o.product
FROM customers c
inner JOIN orders o 
ON c.customer_id = o.customer_id group by o.customer_id,c.customer_id,o.product;

select sum(amount) from orders group by customer_id;

##JOINS WITH GROUP BY
-- Suppose we want to find the total amount spent by each customer.
SELECT
  c.customer_name,c.city,
  sum(o.amount) as 'total_amount_spent'
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
group by c.customer_id, c.customer_name order by total_amount_spent desc;

SELECT
  c.customer_name,c.city,
  sum(o.amount) as 'total_amount_spent'
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
group by c.customer_id, c.customer_name 
HAVING c.city in ('pune', 'Nagpur', 'Mumbai') order by c.city desc limit 3;

##JOINS WITH HAVING
-- Find customers whose total purchase is greater than ₹30,000.
SELECT
  c.customer_name,
  sum(o.amount) as 'total_amount'
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
group by c.customer_id, c.customer_name 
having sum(o.amount)>30000;

## Multiple Table Join
-- We can join more than Two tables.
CREATE table products(prod_id varchar(40) primary key,prod_name varchar(50),manufactured_at varchar(100));
insert into products values(501, 'Laptop', 'USA'),(502, 'Mobile', 'South Korea'), (503, 'Keyboard', 'China'),
(504, 'Monitor', 'Taiwan');


