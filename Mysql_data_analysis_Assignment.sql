CREATE DATABASE analysis_sales_db;
USE analysis_sales_db;

CREATE TABLE customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
city VARCHAR(50),
state VARCHAR(50),
signup_date DATE,
segment VARCHAR(30)
);

CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
subcategory VARCHAR(50),
unit_price DECIMAL(10,2)
);

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
sales_channel VARCHAR(30),
payment_method VARCHAR(30),
order_status VARCHAR(30),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
order_item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
discount_pct DECIMAL(5,2),
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers 
VALUES
(101,'Aarav Sharma','Nagpur','Maharashtra','2025-01-15','Retail'),
(102,'Priya Patil','Pune','Maharashtra','2025-02-20','Corporate'),
(103,'Rahul Verma','Mumbai','Maharashtra','2025-03-05','Retail'),
(104,'Sneha Joshi','Nashik','Maharashtra','2025-03-18','SMB'),
(105,'Vikram Singh','Delhi','Delhi','2025-04-10','Corporate'),
(106,'Ananya Rao','Bengaluru','Karnataka','2025-04-25','Retail'),
(107,'Rohan Mehta','Hyderabad','Telangana','2025-05-12','SMB'),
(108,'Neha Kulkarni','Nagpur','Maharashtra','2025-05-30','Retail'),
(109,'Karan Gupta','Jaipur','Rajasthan','2025-06-08','Corporate'),
(110,'Meera Shah','Ahmedabad','Gujarat','2025-06-21','SMB'),
(111,'Aditya Deshmukh','Pune','Maharashtra','2025-07-03','Retail'),
(112,'Isha Kapoor','Delhi','Delhi','2025-07-19','Corporate'),
(113,'Manish Yadav','Indore','Madhya Pradesh','2025-08-02','Retail'),
(114,'Kavya Nair','Kochi','Kerala','2025-08-16','SMB'),
(115,'Siddharth Jain','Mumbai','Maharashtra','2025-09-01','Corporate');

INSERT INTO products 
VALUES
(201,'Laptop Pro 14','Electronics','Laptops',65000.00),
(202,'Laptop Air 13','Electronics','Laptops',52000.00),
(203,'Wireless Mouse','Electronics','Accessories',1200.00),
(204,'Mechanical Keyboard','Electronics','Accessories',3500.00),
(205,'Office Chair','Furniture','Chairs',8500.00),
(206,'Standing Desk','Furniture','Desks',18000.00),
(207,'Monitor 24 Inch','Electronics','Monitors',12500.00),
(208,'Monitor 27 Inch','Electronics','Monitors',18500.00),
(209,'USB-C Hub','Electronics','Accessories',2200.00),
(210,'Bookshelf','Furniture','Storage',6500.00);

INSERT INTO orders 
VALUES
(1001,101,'2025-07-02','Online','UPI','Delivered'),
(1002,102,'2025-07-04','Online','Credit Card','Delivered'),
(1003,103,'2025-07-06','Store','Cash','Delivered'),
(1004,104,'2025-07-09','Online','UPI','Delivered'),
(1005,105,'2025-07-12','Online','Credit Card','Cancelled'),
(1006,106,'2025-07-15','Store','Debit Card','Delivered'),
(1007,107,'2025-07-18','Online','UPI','Delivered'),
(1008,108,'2025-07-22','Store','Cash','Returned'),
(1009,109,'2025-07-25','Online','Credit Card','Delivered'),
(1010,110,'2025-07-28','Online','UPI','Delivered'),
(1011,111,'2025-08-02','Store','Debit Card','Delivered'),
(1012,112,'2025-08-05','Online','Credit Card','Delivered'),
(1013,113,'2025-08-09','Online','UPI','Delivered'),
(1014,114,'2025-08-13','Store','Cash','Delivered'),
(1015,115,'2025-08-18','Online','Credit Card','Delivered'),
(1016,101,'2025-08-21','Online','UPI','Delivered'),
(1017,103,'2025-08-24','Store','Cash','Delivered'),
(1018,105,'2025-08-28','Online','Credit Card','Delivered'),
(1019,108,'2025-09-02','Online','UPI','Delivered'),
(1020,110,'2025-09-05','Store','Debit Card','Delivered'),
(1021,112,'2025-09-08','Online','Credit Card','Cancelled'),
(1022,115,'2025-09-11','Online','UPI','Delivered'),
(1023,102,'2025-09-14','Store','Debit Card','Delivered'),
(1024,106,'2025-09-17','Online','Credit Card','Delivered'),
(1025,109,'2025-09-20','Online','UPI','Delivered');

INSERT INTO order_items 
VALUES
(1,1001,201,1,5.00),(2,1001,203,2,10.00),(3,1002,206,2,5.00),
(4,1002,204,2,0.00),(5,1003,205,1,10.00),(6,1003,203,1,0.00),
(7,1004,207,2,5.00),(8,1005,201,1,0.00),(9,1006,202,1,8.00),
(10,1006,209,2,5.00),(11,1007,208,1,10.00),(12,1007,203,3,5.00),
(13,1008,206,1,0.00),(14,1009,201,2,7.50),(15,1009,209,2,5.00),
(16,1010,205,2,12.00),(17,1011,207,1,5.00),(18,1011,204,1,0.00),
(19,1012,202,2,10.00),(20,1013,210,2,5.00),(21,1013,203,2,0.00),
(22,1014,205,1,5.00),(23,1015,201,1,6.00),(24,1015,208,1,8.00),
(25,1016,204,2,10.00),(26,1016,209,1,5.00),(27,1017,203,4,10.00),
(28,1018,206,1,8.00),(29,1018,207,2,5.00),(30,1019,202,1,5.00),
(31,1019,203,2,0.00),(32,1020,205,2,10.00),(33,1021,201,1,0.00),
(34,1022,208,2,7.00),(35,1023,206,1,5.00),(36,1023,209,2,10.00),
(37,1024,202,1,5.00),(38,1024,207,1,5.00),(39,1025,201,1,10.00),
(40,1025,204,2,5.00);

-- BUSINESS QUESTIONS --

SELECT *FROM customers
WHERE state = 'Maharashtra';

SELECT *FROM products
WHERE unit_price > 10000;

SELECT *FROM orders
WHERE sales_channel = 'Online';

SELECT *FROM customers
WHERE signup_date > '2025-06-01';

SELECT *FROM orders
WHERE order_status = 'Delivered'
AND payment_method = 'UPI';

SELECT *FROM products
WHERE category = 'Electronics'
AND subcategory = 'Accessories';

SELECT *FROM orders
WHERE order_date BETWEEN '2025-08-01' AND '2025-08-31';

SELECT *FROM customers
WHERE customer_name LIKE 'A%';

SELECT *FROM products
WHERE product_name LIKE '%Monitor%';

SELECT *FROM orders
WHERE order_status IN ('Cancelled', 'Returned');

-- AGGREGATION AND GROUP BY --

SELECT state, COUNT(customer_id) AS 'total_customers'
FROM customers
GROUP BY state;

SELECT segment, COUNT(customer_id) AS 'total_customers'
FROM customers
GROUP BY segment;

SELECT category, AVG(unit_price) AS 'avg_price'
FROM products
GROUP BY category;

SELECT category, MAX(unit_price) AS 'max_price', MIN(unit_price) AS 'min_price'
FROM products
GROUP BY category;

SELECT product_id, SUM(quantity) AS 'total_quantity_sold'
FROM order_items
GROUP BY product_id;

SELECT sales_channel, count(order_id) AS 'total_orders'
FROM orders
GROUP BY sales_channel;

SELECT payment_method, count(order_id) AS 'total_orders'
FROM orders
GROUP BY payment_method;

SELECT oi.order_id, 
       SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) AS total_sales_amount 
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY oi.order_id;

SELECT p.category, 
       SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) AS total_delivered_sales 
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category;

SELECT customer_id, COUNT(order_id) AS total_orders 
FROM orders 
GROUP BY customer_id 
HAVING COUNT(order_id) > 1;

## JOIN-BASED ANALYSIS

SELECT o.order_id, c.customer_name, o.order_date, o.order_status, o.sales_channel
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

SELECT oi.order_id, p.product_name, oi.quantity, p.unit_price, oi.discount_pct
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

SELECT c.customer_name, c.city, p.product_name, p.category, oi.quantity, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

SELECT c.customer_id, c.customer_name, 
SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) AS total_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name;

SELECT c.city, 
SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) AS total_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.city;

SELECT p.product_id, p.product_name, 
SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 5;

SELECT c.customer_id, c.customer_name, 
COUNT(DISTINCT oi.product_id) AS distinct_products_count
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name;

SELECT DISTINCT c.customer_id, c.customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.product_name LIKE '%Laptop%' OR p.category LIKE '%Laptop%';

SELECT p.*
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

SELECT p.category, SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category;

## HAVING AND BUSINESS KPI QUESTIONS

SELECT p.category, 
SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
HAVING total_revenue > 50000;

SELECT c.customer_id, c.customer_name, 
SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) AS total_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
HAVING total_revenue > 50000;

SELECT city, COUNT(customer_id) AS total_customers
FROM customers
GROUP BY city
HAVING COUNT(customer_id) > 2;
SELECT p.product_id, p.product_name, SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(oi.quantity) > 5;

SELECT 
SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) / COUNT(DISTINCT o.order_id) AS average_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered';

SELECT 
    SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS total_customers,
    SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) / COUNT(DISTINCT o.order_id) AS average_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered';

SELECT 
    p.category,
    SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) AS category_revenue,
    (SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) / 
        (SELECT SUM(oi2.quantity * p2.unit_price * (1 - oi2.discount_pct / 100)) 
         FROM orders o2 
         JOIN order_items oi2 ON o2.order_id = oi2.order_id 
         JOIN products p2 ON oi2.product_id = p2.product_id 
         WHERE o2.order_status = 'Delivered')
    ) * 100 AS percentage_contribution
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category;

SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
    SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY total_revenue DESC
LIMIT 1;

SELECT payment_method, COUNT(order_id) AS delivered_orders_count
FROM orders
WHERE order_status = 'Delivered'
GROUP BY payment_method
ORDER BY delivered_orders_count DESC
LIMIT 1;

SELECT 
    (COUNT(CASE WHEN order_status = 'Cancelled' THEN 1 END) / COUNT(*)) * 100 AS cancellation_rate
FROM orders;

## SUBQUERIES - WITHOUT CTE

SELECT * FROM products 
WHERE unit_price > (SELECT AVG(unit_price) FROM products);

SELECT * FROM customers 
WHERE customer_id IN (SELECT DISTINCT customer_id FROM orders);
SELECT * FROM customers 
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);

SELECT p1.* FROM products p1
WHERE p1.unit_price > (
    SELECT AVG(p2.unit_price) 
    FROM products p2 
    WHERE p2.category = p1.category
);

SELECT * FROM products 
WHERE unit_price = (
    SELECT MAX(unit_price) 
    FROM products 
    WHERE unit_price < (SELECT MAX(unit_price) FROM products)
);

SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > (
    SELECT AVG(order_count)
    FROM (
        SELECT COUNT(order_id) AS order_count
        FROM orders
        GROUP BY customer_id
    ) AS temp_table
);

SELECT order_id, 
       SUM(quantity * unit_price * (1 - discount_pct / 100)) AS total_order_value
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY order_id
HAVING total_order_value > (
    SELECT AVG(order_val)
    FROM (
        SELECT SUM(oi2.quantity * p2.unit_price * (1 - oi2.discount_pct / 100)) AS order_val
        FROM order_items oi2
        JOIN products p2 ON oi2.product_id = p2.product_id
        GROUP BY oi2.order_id
    ) AS temp_table
);

SELECT * FROM products 
WHERE unit_price = (SELECT MAX(unit_price) FROM products);

SELECT DISTINCT c.*
FROM customers c
WHERE c.customer_id IN (
    SELECT o.customer_id
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE p.category = 'Electronics'
);

SELECT c.city, 
       SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) AS total_delivered_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.city
HAVING total_delivered_revenue = (
    SELECT MAX(city_rev)
    FROM (
        SELECT SUM(oi2.quantity * p2.unit_price * (1 - oi2.discount_pct / 100)) AS city_rev
        FROM orders o2
        JOIN customers c2 ON o2.customer_id = c2.customer_id
        JOIN order_items oi2 ON o2.order_id = oi2.order_id
        JOIN products p2 ON oi2.product_id = p2.product_id
        WHERE o2.order_status = 'Delivered'
        GROUP BY c2.city
    ) AS temp_table
);

## CASE EXPRESSION AND DATA SEGMENTATION

SELECT product_id, product_name, unit_price,
    CASE 
        WHEN unit_price < 5000 THEN 'Budget'
        WHEN unit_price BETWEEN 5000 AND 20000 THEN 'Mid-Range'
        ELSE 'Premium'
    END AS price_category
FROM products;

SELECT c.customer_id, c.customer_name,
    SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) AS total_revenue,
    CASE 
        WHEN SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) < 20000 THEN 'Low'
        WHEN SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) BETWEEN 20000 AND 50000 THEN 'Medium'
        ELSE 'High'
    END AS customer_revenue_segment
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name;

SELECT oi.order_id,
    SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) AS total_order_value,
    CASE 
        WHEN SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) < 10000 THEN 'Small'
        WHEN SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) BETWEEN 10000 AND 30000 THEN 'Medium'
        ELSE 'Large'
    END AS order_size_category
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY oi.order_id;

SELECT c.customer_id, c.customer_name,
    COUNT(o.order_id) AS total_orders,
    CASE 
        WHEN COUNT(o.order_id) = 1 THEN 'New'
        WHEN COUNT(o.order_id) = 2 THEN 'Regular'
        WHEN COUNT(o.order_id) >= 3 THEN 'Frequent'
        ELSE 'No Orders'
    END AS activity_label
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;
SELECT order_id, product_id, discount_pct,
    CASE 
        WHEN discount_pct = 0 OR discount_pct IS NULL THEN 'No Discount'
        WHEN discount_pct BETWEEN 1 AND 5 THEN 'Low Discount'
        WHEN discount_pct > 5 AND discount_pct <= 10 THEN 'Medium Discount'
        WHEN discount_pct > 10 THEN 'High Discount'
        ELSE 'Other'
    END AS discount_category
FROM order_items;

## DATE AND STRING FUNCTIONS

SELECT order_id, 
       order_date, 
       YEAR(order_date) AS order_year, 
       MONTH(order_date) AS order_month_number, 
       MONTHNAME(order_date) AS order_month_name
FROM orders;

SELECT YEAR(order_date) AS order_year, 
       MONTHNAME(order_date) AS order_month_name, 
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date), MONTHNAME(order_date)
ORDER BY order_year, MONTH(order_date);

SELECT *FROM customers 
WHERE DATEDIFF('2025-09-20', signup_date) > 180;

SELECT c.customer_id, 
       c.customer_name, 
       c.signup_date, 
       MIN(o.order_date) AS first_order_date,
       DATEDIFF(MIN(o.order_date), c.signup_date) AS days_to_first_order
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.signup_date;

SELECT customer_id, UPPER(customer_name) AS customer_name_upper 
FROM customers;

SELECT customer_name, LEFT(customer_name, 3) AS short_name 
FROM customers;

SELECT DISTINCT city, 
       UPPER(city) AS city_upper, 
       LENGTH(city) AS city_name_length 
FROM customers;

SELECT *FROM orders 
WHERE DAYOFWEEK(order_date) IN (1, 7);

SELECT order_id, 
       order_date, 
       DATEDIFF('2025-09-20', order_date) AS days_difference 
FROM orders;

SELECT order_id, 
       order_date, 
       DATE_FORMAT(order_date, '%Y-%m') AS year_month_format 
FROM orders;

## WINDOWS FUNCTION - WITHOUT CTE
