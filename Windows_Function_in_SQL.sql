use bankingdb;
-- 1) ROW_NUMBER()

SELECT
salary,
row_number() over(order by salary desc)
from employee;

-- 2) Assign rank to each employee with respect to salary
 
 SELECT
 salary,
 rank() over(order by salary desc)
 from employee;
 
 use bankingdb;
 
 create table sales_new (
 sale_id INT PRIMARY KEY,
 employee_name VARCHAR(50),
 department VARCHAR(50),
 sale_date DATE,
 amount DECIMAL(10,2)
 );
 
 insert into sales_new
 (sale_id, employee_name, department, sale_date, amount)
 values
 (1, 'Amit', 'Electronics', '2026-01-05', 50000),
 (2, 'Priya', 'Electronics', '2026-01-10', 75000),
 (3, 'Rahul', 'Electronics', '2026-01-15', 75000),
 (4, 'Sneha', 'Electronics', '2026-01-20', 90000),
 (5, 'Vikas', 'Clothing', '2026-01-05', 40000),
 (6, 'Neha', 'Clothing', '2026-01-10', 60000),
 (7, 'Rohit', 'Clothing', '2026-01-15', 60000),
 (8, 'Pooja', 'Clothing', '2026-01-20', 85000),
 (9, 'Karan', 'Furniture', '2026-01-05', 30000),
 (10, 'Anjali', 'Furniture', '2026-01-10', 55000);
 
 select *from sales_new;
 
 -- Windows Functions ---
 
 -- 1) Assign row number
 
 select
 *,row_number() over(order by amount DESC) AS 'ROW NUMBER()',
 RANK() over(order by amount DESC) AS 'RANK()',
 dense_rank() over( order by amount DESC) as 'DENSE_RANK()'
 from sales_new;
 
 -- 2) Partition By --
 select department,amount,
 rank()
 over(partition by department order by amount desc) as 'department rank',
 dense_rank()
 over(partition by department order by amount desc) as 'department dense rank',
 sum(amount)
 over(partition by department order by department desc) as 'total amount',
 sum(amount)
 over(partition by department order by amount desc) as 'running total department_wise',
 sum(amount)
 over( order by amount desc) as 'running total across all rows'
 from sales_new;
 
 -- 3) Percentage_wise contribution of each department
 
 select
 employee_name,department,amount,
 round (amount/sum(amount) over(partition by department)*100,2) as 'Departementwise_employee_contribution'
 from sales_new;
 
 -- LAG()-->compare CURRENT value with the previous values --
 select
 sale_id, department, amount, sale_date,
 lag(amount) over(order by sale_date),
 lead(amount) over(order by sale_date)
 from sales_new;
 
 -- Running Toatal with use of sum() ---
 
 select sale_id, department, sale_date, amount,
 sum(amount) over(partition by department order by sale_date) as 'running_total'
 from sales_new;
 
 -- Average Sale departmentwise ---
 
 select 
 sale_id, department, sale_date, amount,
concat('$',round(avg(amount) over(partition by department order by sale_date), 2)) as 'Average sales'
 from sales_new;
 
 -- First_Value & Last_Value --
 
 select
 department,amount,
 first_value(amount) over(partition by department order by amount desc) as 'First_Value',
 last_value(amount) over(partition by department order by amount desc) as 'Last_Value'
 from sales_new;
 
 -- NTILE()--> Divides rows into a specified number of approximately equal groups --
 
 select 
 department,amount, ntile(6) over(order by amount desc) as amount_3_quartile
 from sales_new;
 
 