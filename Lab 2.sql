create database BankingDB;

use BankingDB;

CREATE table IF NOT EXISTS Customers(
CustomerID int,FirstName Varchar(50), 
LastName Varchar(50), Email Varchar(100),
 Phone varchar(20)
 );
 
 desc Customers;
 
 -- to add new column 'AccountCreationDate' --->DATE --
 alter table Customers
 add AccountCreationDate date;
 
 insert into Customers
 (CustomerID,FirstName,LastName,Email,Phone,AccountCreationDate)
 values(101,'Raj','kurve','raj_k@gmail.com','9881004242','2025-10-25');
 
 -- to retrieve data from table --
 -- syntax: Select *from <table_name>; --
 select *from Customers;
 
 select FirstName,Email,AccountCreationDate
 from Customers;
 
  CREATE TABLE Accounts (
AccountID INT,
AccountType VARCHAR(20),
Balance DECIMAL(10, 2)
);
 
 desc Accounts;
 CREATE TABLE Transactions (
 TransactionID INT,
 TransactionDate DATE,
 Amount DECIMAL(10, 2),
 TransactionType VARCHAR(20)
 );
 
CREATE TABLE Branches(
BranchID INT, BranchName varchar(100),
BranchAddress varchar(200), BranchPhone varchar(15)
);

CREATE TABLE AccountBranches(
AssignmentDate date
);

CREATE TABLE Loans(
LoanID int, LoanAmount decimal(10, 2), IntrestRate decimal(5, 2), StarDate Date, EndDate date
);

-- structure of table --
desc Accounts;
desc Transactions;

show tables;

modify table structure by using Alter command

1) add new columns
2) modify existing columns
3) rename columns
4) add constraints
5) remove constraints
*/
desc customers;

show tables;

-- change datatype of existing column --
alter Table customers modify Phone bigint;

desc customers;

alter table customers add column Balance bigint;

-- Add minimum Balance constraints --
alter table customers
add constraint chk_MinBalance
check(Balance>=5000);

-- drop 'accountbranches' table --
-- syntax DROP TABLE <table_name>; --
DROP table accountbranches;

desc customers;

-- Add Primary Key Constraints to 'customerID' in Customers table --
alter table customers
add primary key(CustomerID);

-- Add unique constraints to 'Phone' of 'Customers' table
alter table customers
add unique(Phone);

