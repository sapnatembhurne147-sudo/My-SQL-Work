use n325_db;

create table company(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(100),
department VARCHAR(50),
job_role VARCHAR(50),
salary DECIMAL(10,2) default 20000,
hire_date DATE,
city VARCHAR(50)
);


INSERT INTO company
(emp_id, emp_name, department, job_role, salary, hire_date, city)
values
(101, 'Rahul Sharma', 'IT', 'Developer', 65000, '2021-01-15', 'Nagpur'),
(102, 'Priya Singh', 'HR', 'HR Manager', 75000, '2020-05-20', 'Mumbai'),
(103, 'Amit Kumar', 'IT', 'Developer', 70000, '2022-03-10', 'Pune'),
(104, 'Sneha Patil', 'Finance', 'Accountant', 60000, '2021-07-12', 'Nagpur'),
(105, 'Rohit Verma', 'IT', 'Tester', 55000, '2023-02-18', 'Mumbai'),
(106, 'Neha Joshi', 'HR', 'Recruiter', 50000, '2022-11-25', 'Pune'),
(107, 'Vikas Gupta', 'Finance', 'Manager', 85000, '2019-09-30', 'Delhi'),
(108, 'Anjali Rao', 'IT', 'Developer', 80000, '2020-12-05', 'Delhi'),
(109, 'Suresh Yadav', 'Sales', 'Executive', 45000, '2023-06-15', 'Nagpur'),
(110, 'Pooja Mehta', 'Sales', 'Manager', 70000, '2021-10-10', 'Mumbai');

select *from company;

## STRING FUNCTIONS
select emp_name,length(emp_name) as 'No of Characters' from company;

-- CONCAT()
select concat(emp_name,'-',department)from company;

-- SUBSTR(string, start_position, length)
select city,substr(city,1,3) from company;

select substr(emp_name,2,4),substring(emp_name,-1,2) from company;

select substring(emp_name,2,4) from company;

-- TRIM(): Removes unnecessary space--
select
emp_name,trim(emp_name) AS cleaned_name
from company;

select length('  Nagpur  '),length(trim('  Nagpur  ')) from dual;

-- replace(old_str,new_str) --
select emp_name from company;
select
emp_name,
replace(emp_name, 'a', '@') as modified_name, replace(emp_name, 'g', '9'), replace(emp_name, 's', '5')
from company;

## Mathematical Functions
-- 1) round()
select
emp_name,
salary,salary/12,
round(salary/12, 3) as monthly_salary
from company;

-- 2) FLOOR()
select
salary/12,
floor(salary/12) as rounded_down_salary,
ceil(salary/12) as rounded_high_salary
from company;

-- 3) ABS()
select ABS(-222) from dual;
select
emp_name,job_role,salary,salary-60000,
ABS(salary - 60000) as salary_difference
from company;

-- 4) MOD():
select
emp_id,
mod(emp_id, 2) as remainder,
mod(salary,2)
from company;
-- 5) POWER()
SELECT
salary,
power(salary,2) as salary_square
from company;

### COMPARISION OPERATORS

-- 1) GREATEST(): return the largest value.
select max(salary) from company;

select greatest(78,12,781,234,78989,133098) from dual;

select greatest(salary,50000) as 'salary greater than 50000' from company;

select
department,
salary,
greatest(salary, 60000) as greater_salary
from company;

-- 2) LEAST()--> Return smallest value --
select least(12,11,34,09,46,3) from dual;

select 
salary,
least(salary, 60000) as salary_less_than_60000
from company;

## COMPARISION OPERATORS

SELECT emp_name,salary
from company
where salary > 60000;

select department,concat('₹',round(sum(salary),0)) as 'Departmentwise_salary'
from company
group by department having sum(salary)>120000 order by sum(salary) desc;
use n325_db;
-- DISTINCT()--> it returns unique value of columns --
select count(distinct city) as 'UNIQUE CITIES',
count(city) AS 'TOTAL CITIES' from company;

-- SALARY INCREASE BY 25% --
select EMP_NAME,SALARY,SALARY*1.25 AS 'SALARY INCREASE BY 25%'
FROM COMPANY
WHERE CITY= 'NAGPUR';

SELECT SALARY,SALARY*(1-0.25) AS 'salary reduced by 25%',salary*0.9 as 'salary reduced by 10%'
from company;

# Not equals to --> <>
select * from company where salary != 50000;

#comparision based on classification
select *,
case
  when salary >= 75000 then 'High Salary'
  when salary >= 60000 then 'Medium salary'
  else 'Low Salary'
  end as salary_category
from employee;

## Aggregation functions in SQL
-- Aggregation functions performs calculation on multiple rows.
select count(emp_id) as total_employee_in_company
from company;
select department,count(*) as 'department_wise_employees' from company group by department;

select department,sum(salary) as total_employees
from company group by department;

select department,avg(salary) as total_salary
from company
group by department;

-- MAX()
select max(salary) as 'maximum_salary',min(salary) as 'minimum_salary'
from company group by department;

-- All Aggregation function --
select
  count(*) as total_employees,
  sum(salary) as total_salary,
  avg(salary) as average_salary,
  max(salary) as highest_salary,
  min(salary) as lowest_salary
from company;

 

