use bankingdb;

create table student (
stud_id varchar(50), stud_name varchar(50), address varchar(50),
city varchar(50)
);

insert into student values(1, 'Shashank', 'RJPM', 'Lucknow');

alter table student add column DOB date;

desc student;

alter table student modify column stud_name varchar(100);

-- drop column 'city' --
-- syntax alter table <table_name> drop column <column_name>;
alter table student drop column city;

create table if not exists teacher(
teacher_id int(50), teacher_name varchar(100), hiring_date date,
age int, salary int(100)
);

desc teacher;

insert into teacher values(1, 'Kamal', '2021-08-09', 28, 50000),
(2, 'Reshma', '2020-12-12', 34, 67000), (3, 'Ujjwal', '2023-11-23', 25, 15000),
(4, 'Jay', '2025-11-10',30,56000);

select *from teacher;

select *from student;

desc student;

alter table student add constraint pk_stud_id primary key(stud_id);

-- rename column --
-- syntax: alter table <table_name> rename column <old column_name> to <new column_name>;
alter table student rename column stud_name to name;

insert into student values('s01','Gaurav','Dharampeth','2005-10-10'),
('s02','Kunal','Reshimbag','1999-10-08'),('s03','Farhan','Mominpura','1997-12-10'),
('s04','Vaibhav','Vayusena Nagar','2000-11-14'),('s05','Vishal','Pratap Nagar','2009-08-07'),
('s06','Kumar','Ravi Nagar','2005-02-05'),('s07','Dinesh','Sitabuldi','1996-12-12'),
('s08','Tanushree','Medical Square','2009-12-13');

select *from student;

-- how to count total records of table --
-- alias declaration --
select count(*) as 'Number of Students'
from student;

select DOB,month(DOB),monthname(DOB),dayname(DOB),dayofweek(DOB),curdate() as 'Today Date',
datediff(curdate(),DOB) as 'number of day till today', year(datediff(curdate(),DOB)) as 'year'
from student;

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    City VARCHAR(50)
);
INSERT INTO Employee
(EmployeeID, EmployeeName, Department, Salary, City)
values
(3, 'Priya Patil', 'HR', 45000, 'Pune'),
(4, 'Amit Kumar', 'Finance', 60000, 'Delhi'),
(5, 'Sneha Joshi', 'IT', 55000, 'Nagpur'),
(6, 'Rohan Verma', 'Marketing', 48000, 'Mumbai');

select *from employee;

select Department,count(*) as 'Number of Employee'
 From employee
 group by Department
 having count(EmployeeID)>=2
 order by Department ASC;

-- Total Salary department wise --
select City,count(*) as 'Number of Employee'
from employee
group by City
order by City desc;

-- Total Salary department wisw --
select department,sum(salary)
from employee
group by department
order by sum(salary) desc
limit 3;


-- Aggregation Function in SQL - 07Sep2026

-- 1) Total number of employees
select count(*) as 'Total Employees' from employee;

-- 2) Total Salary
select sum(salary) as 'Total Salary' from employee;

-- 3) Total Salary department wise
select Department, sum(Salary) as 'Total Salary' from employee group by department;

-- 4) Average salary department wise 
select Department,round(avg(salary),0) as 'Average Salary'
from employee group by department;

-- Aggregation function on salary department wise --
select
 department,
 concat("₹",round(sum(salary),0)) as 'Total Salary', 
 concat("₹",round(max(salary),0)) as 'Maximum Salary',
 concat("₹",round(min(salary),0)) as 'Minimum Salary',
 count(*) as 'Number of Employees'
from employee
group by department
order by avg(salary);

-- Pattern Matching --
-- Find Employee whoose name starts with 'R' --
select *from employee
where EmployeeName like 'R%';

-- Find Employee whoose name starts with 'a' --
select *from employee
where EmployeeName like '%a';

-- Find Employee whoose name contains 'a' --
select *from employee
where EmployeeName like '%a%';

-- Find Employee whoose second character is 'a' '-a' --
select *from employee
where EmployeeName like '-a%';

-- Find the city which has only 5 characters --
select city from employee
where city like '-----';

-- Find the city which starts with 'M'
select *from employee
where city like 'M%';







