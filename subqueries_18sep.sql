use shoppingdb;

CREATE TABLE users (
  user_id INT PRIMARY KEY,
  username VARCHAR(50),
  country VARCHAR(50),
  followers int
);

CREATE TABLE posts (
  post_id INT PRIMARY KEY,
  user_id INT,
  post_text VARCHAR(255),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO users 
(user_id, username, country, followers)
VALUES
(1, 'Rahul', 'India', 800000),(2, 'Priya', 'India', 600000),(3, 'Amit', 'India', 300000),(4, 'Sneha', 'USA', 900000),
(5, 'John', 'USA', 700000),(6, 'Emma', 'USA', 400000),(7, 'Rohan', 'UK', 200000),(8, 'Sophia', 'UK', 100000);

INSERT INTO posts
(post_id, user_id, post_text)
VALUES
(101, 1, 'Learning SQL'),(102, 1, 'Learning python'),(103, 2, 'Data Science'),(104, 4, 'Machine Learning'),
(105, 4, 'AI Tutorial'),(106, 5, 'Power BI'),(107, 7, 'My First Post');

## SUBQUERIES ##
/* A subquery is a query that is written inside another SQL query. 
it is also called a nested query or inner query.
*/

--- Type - 1
## Scalar Subquery : A scalar subquery returns one row and one column, i.e. a single value.
## A single -row subquery returns only one row/value.

-- 1) Find average followers
select round(avg(followers),2) as 'Average Followers'
from users;

-- 2) Find the username whoose followers are less than equal to average followers

select username, followers
from users
where followers <= (
  select avg(followers)
  from users
);

-- 3) Find User with Maximum Followers
select Max(followers)
from users;
select username, followers, country
from users
where followers = (
  select max(followers)
  from users
);

-- 4) Find User with minimum Followers 
select username, followers, country
from users
where followers = (
  select min(followers)
  from users
);

-- 5) Find users above 500,000 followers

select username, followers, country
from users
where followers > 500000;

-- select count (distinct country) from users;
-- using a sub-query

select username, followers
from users 
where followers > (
select 500000
);

-- Type - 2
## Multiple - Row Subquery
/*
A multiple - Row Subquery returns multiple rows. It is commonly used with:
1) IN 2) ANY 3) ALL 4) EXISTS
*/

## IN with subquery

select country, sum(followers)
  from users
  group by country;
-- HAVING AVG (followers) > 500000;

-- 1) find users from countries whose average followers exceed 500000
select username, country, followers
from users
where country IN (
  select country
  from users
  group by country
  HAVING AVG (followers) > 500000
);

 select country
  from users
  group by country
  HAVING AVG (followers) > 500000;
  
select country,sum(followers) from users group by country having country in (select country
from users
group by country
having avg(followers) > 500000
);
  
select followers from users where followers > 500000;

--- 2) NOT IN with subquery

select country
from users
group by country
having avg(followers) > 500000;

select country
from users
where country not in (
select country
from users
group by country
having avg(followers) > 500000
);

## 3) ANY with subquery
-- ANY compares a value with at least one value returned by the subquery.

--- Q:finds users whose followers are greater than at least one of these values
select username, followers
from users
where followers > ANY (
  select followers
  from users
  where country = 'UK'
);

## 4) ALL with subquery
-- ALL Requires the coparision to be true for every value returned by the subquery.
select followers
from users
where country = 'UK';

--- Q:finds users whose followers are greater than every UK users followers.

select username, followers
from users
where followers > ALL (
  select followers
  from users
  where country = 'UK'
);

## 5) EXISTS WITH SUBQUERY
-- EXISTS checks whether the subquery returns at least one record. 

-- Q: find users who have created at least one post

select username
from users u 
where EXISTS (
  select 1
  from posts p 
  where p.user_id = u.user_id
);

## 6) NOT EXISTS
-- Q: Find the users who have never created a post

select user_id, username
from users u 
where not exists (
  select 1
  from posts p 
  where p.user_id = u.user_id
  );
  
  ## Type - 3
  ## Correlated Subquery: A correlated subquery references a column the outer query and is evaluated
  -- Q: Find users whose followers are greater than thier country's average
  
select*from users;
select country, avg(followers) 
from users
group by country order by avg(followers) desc;

select
  u1.username,
  u1.country,
  u1.followers
from users u1
where u1.followers > (
  select avg(u2.followers)
  from users u2
  where u2.country = u1.country
  );
  
  select
  u1.username,
  u1.country,
  u1.followers
from users u1
where u1.followers < (
  select avg(u2.followers)
  from users u2
  where u2.country = u1.country
  );
  
  ## guess find users 
  select
  u.username,
  u.country,
  u.followers
from users u
where u.followers > (
  select avg(x.followers)
  from users x
  where x.country = x.country
  );
  
## Subquery in FROM
/*
A subquery inside from is called a:
1) Derived table 2) Table subquery 3) Inline view

It behaves like a temporary table and must have an alias in MySQL.
*/

select 
    country,
    avg(followers) as avg_followers
from users
group by country;

select 
  country_data.country,
  country_data.avg_followers
from (
 select
   country,
   avg(followers) as avg_followers
from users
group by country
) as country_data
where country_data.avg_followers > 500000;

select *
from(
 select
   country,
   count(user_id) as total_users,
   avg(followers) as avg_followers
from users
group by country
) as country_summary where country = 'USA';

## derived Table with WHERE clause
select *
from (
  select
   country,
   avg(followers) as avg_followers
from users
group by country
) as country_data
where avg_followers > 500000;

## Subquery in where clause
-- Subquery in where clause are commonly used for fillering
select distinct user_id from posts;

-- Q-1: Find user who have Posts
select user_id,username
from users
where user_id IN (
  select distinct user_id from posts);
  
-- Q-2: Find Users without Posts
select username
from users
where user_id not IN (
select distinct user_id from posts);
 
## Nested Subquery: A Subquery can contain another subquery.
-- select avg(followers)
-- from users
 -- where country = (
 --    select country
 --    from users
 --    where username = 'Rahul');
-------------------------------------------------    
   
select username, followers
from users
where followers > (
   select avg(followers)
   from users
   where country = (
       select country
       from users
       where username = 'Rahul'
       )
	);





