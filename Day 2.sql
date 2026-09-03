-- Constraints in SQL --
-- Date: 31Aug2026 --
-- 1) NOT NULL: Values or blank values are not allowed --
USE bankingdb;
CREATE TABLE Persons (
ID int NOT NULL,
LastName Varchar(255) NOT NULL,
firstName varchar(255) NOT NULL,
Age int 
);
desc Persons;

-- Add null contraints to 'Age' column --
ALTER table Persons modify column Age int not null;

insert into Persons values(1, 'Pandey', 'Hitesh', 33, );

select FirstName, LastName, concat(firstName,"_",LastName) as 'Employee Name' from Persons;

-- Unique --
Alter table Persons add column Email varchar(200);

Alter table Persons modify column Email varchar(200) unique;

desc Persons;
insert into Persons values(2, 'Saxsena', 'Rajiv', 23, 'rajiv_saxsena@gmail.com'),
(3, 'Kapoor', 'Jay', 26, 'kapoor_jay12@gmail.com'),
(4, 'Ganatra', 'Bhavin', 23, 'ganatra_bhavin12@gmail.com');

select *from Persons;

ALTER table Persons modify column ID int primary key;

desc Persons;

-- CHECK() contraint on 'age' column --
alter table Persons modify column age int check(age>18);
select *from Persons;

insert into Persons values(7, 'Gandhi', 'Rahul', 55, 'gandhi_rahul155@gmail.com');

-- Date: 01/Sep/2026 --
-- Default Contraint in sql --
-- DEFAULT : The DEFAULT contraint is used to automatically assign a ddefault value to a column
-- when no value is specified during an INSERT operation. --

CREATE TABLE Employee (
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR (100) NOT NULL,
Department VARCHAR (50),
Salary DECIMAL(10,2),
JoiningDate DATE DEFAULT (CURRENT_DATE),
City VARCHAR (50)
);


alter table Employee modify column JoiningDate DATE default '2026-09-01';
SELECT * FROM Employee;
desc Employee;






-- Insert one Record --
INSERT INTO Employee
(EmployeeID, EmployeeName, Department, Salary, City) values (1, 'Rahul Sharma', 'IT', 50000, 'Mumbai');

-- Insert Multiple Record --




INSERT INTO Employee
(EmployeeID, EmployeeName, Department, Salary, City)
values
(3, 'Priya Patil', 'HR', 45000, 'Pune'),
(4, 'Amit Kumar', 'Finance', 60000, 'Delhi'),
(5, 'Sneha Joshi', 'IT', 55000, 'Nagpur'),
(6, 'Rohan Verma', 'Marketing', 48000, 'Mumbai');

# Adding DEFAULT Contraint to an existing table:
ALTER TABLE Employee
ALTER City SET DEFAULT 'Nagpur';

desc Employee;


-- Insert Using DEFAULT Value --
INSERT INTO Employee
(EmployeeID, EmployeeName, Department, Salary)
values
(7, 'Neha Singh', 'HR', 52000);
select *from Employee;





# Foreign Key
/* A FOREIGN KEY is used to crete a relationship between two tables.

It ensure that a value in one table must exist in another table. */

# 1) create the Parent table
CREATE TABLE Department (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50)
);


# 2) Insert Data into Department table
/*INSERT INTO Department (DepartmentID, DepartmentName)
values
(101, 'IT'),
(102, 'HR'),
(103, 'Finance');*/


# 3) Create the Child Table with a FOREIGN KEY.
DROP TABLE IF EXISTS Employee_child;
CREATE TABLE Employee_child (
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(100),
DepartmentID INT,

foreign key (DepartmentID)
references Department(DepartmentID)
);


CREATE TABLE IF NOT EXISTS manager (
manager_id INT PRIMARY KEY,
mgr_name VARCHAR(20),
DepartmentID INT, 
FOREIGN KEY (DepartmentID)
references department(DepartmentID)
);

TRUNCATE TABLE customers;


ALTER TABLE employee_child ADD CONSTRAINT fk_emp_cust 
FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID);

ALTER TABLE persons MODIFY ID INT PRIMARY KEY;
ALTER TABLE customers ADD COLUMN PersonID INT;
ALTER TABLE customers ADD CONSTRAINT fk_cust_person 
FOREIGN KEY (PersonID) REFERENCES persons(ID);