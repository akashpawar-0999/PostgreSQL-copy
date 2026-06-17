-- HERE WE ARE USING OLD TABLE "products"
-- refer all 



-- To see whole products Table :
SELECT * FROM products;
-- +----+--------------------+---------+-------+-----------+----------------------------+
-- | id | name               | price   | stock | is_active | created_at                 |
-- +----+--------------------+---------+-------+-----------+----------------------------+
-- | 1  | Mechanical Keyboard| 1299.00 | 50    | true      | 2026-06-17 22:26:15.477925 |
-- | 2  | Wireless Mouse     | 499.00  | 30    | true      | 2026-06-17 22:27:08.729182 |
-- | 3  | Monitor            | 8999.00 | 10    | true      | 2026-06-17 22:30:53.633386 |
-- | 4  | USB Hub            | 299.00  | 100   | true      | 2026-06-17 22:30:57.290473 |
-- | 5  | Webcam             | 1599.00 | 20    | true      | 2026-06-17 22:30:57.290473 |
-- | 6  | Desk Lamp          | 449.00  | 45    | true      | 2026-06-17 22:30:57.290473 |
-- | 7  | Mouse Pad          | 99.00   | 200   | true      | 2026-06-17 22:30:57.290473 |
-- | 8  | HDMI Cable         | 149.00  | 80    | true      | 2026-06-17 22:30:57.290473 |
-- | 9  | Laptop Stand       | 899.00  | 15    | false     | 2026-06-17 22:30:57.290473 |
-- | 10 | Bluetooth Speaker  | 2499.00 | 25    | true      | 2026-06-17 22:31:00.008680 |
-- | 11 | Gaming Headset     | 3299.00 | 12    | true      | 2026-06-17 22:33:16.370779 |
-- +----+--------------------+---------+-------+-----------+----------------------------+



-- SELECT SPECIFIC COLUMNS ONLY
SELECT name, price, stock
FROM products;
-- +---------------------+---------+-------+
-- | name                | price   | stock |
-- +---------------------+---------+-------+
-- | Mechanical Keyboard | 1299.00 | 50    |
-- | Wireless Mouse      | 499.00  | 30    |
-- | Monitor             | 8999.00 | 10    |
-- | USB Hub             | 299.00  | 100   |
-- | Webcam              | 1599.00 | 20    |
-- | Desk Lamp           | 449.00  | 45    |
-- | Mouse Pad           | 99.00   | 200   |
-- | HDMI Cable          | 149.00  | 80    |
-- | Laptop Stand        | 899.00  | 15    |
-- | Bluetooth Speaker   | 2499.00 | 25    |
-- | Gaming Headset      | 3299.00 | 12    |
-- +---------------------+---------+-------+



-- COLUMN ALIAS — rename column in output using AS
SELECT name        AS product_name,
       price       AS cost,
       stock       AS available_qty
FROM products;
-- +---------------------+---------+---------------+
-- | product_name        | cost    | available_qty |
-- +---------------------+---------+---------------+
-- | Mechanical Keyboard | 1299.00 | 50            |
-- | Wireless Mouse      | 499.00  | 30            |
-- | Monitor             | 8999.00 | 10            |
-- | USB Hub             | 299.00  | 100           |
-- | Webcam              | 1599.00 | 20            |
-- | Desk Lamp           | 449.00  | 45            |
-- | Mouse Pad           | 99.00   | 200           |
-- | HDMI Cable          | 149.00  | 80            |
-- | Laptop Stand        | 899.00  | 15            |
-- | Bluetooth Speaker   | 2499.00 | 25            |
-- | Gaming Headset      | 3299.00 | 12            |
-- +---------------------+---------+---------------+



-- Calculate total value of each product (price * stock):
SELECT name,
       price,
       stock,
       price * stock AS total_value    -- computed column, not stored in table
FROM products;
-- +---------------------+---------+-------+------------+
-- | name                | price   | stock | total_value|
-- +---------------------+---------+-------+------------+
-- | Mechanical Keyboard | 1299.00 | 50    | 64950.00   |
-- | Wireless Mouse      | 499.00  | 30    | 14970.00   |
-- | Monitor             | 8999.00 | 10    | 89990.00   |
-- | USB Hub             | 299.00  | 100   | 29900.00   |
-- | Webcam              | 1599.00 | 20    | 31980.00   |
-- | Desk Lamp           | 449.00  | 45    | 20205.00   |
-- | Mouse Pad           | 99.00   | 200   | 19800.00   |
-- | HDMI Cable          | 149.00  | 80    | 11920.00   |
-- | Laptop Stand        | 899.00  | 15    | 13485.00   |
-- | Bluetooth Speaker   | 2499.00 | 25    | 62475.00   |
-- | Gaming Headset      | 3299.00 | 12    | 39588.00   |
-- +---------------------+---------+-------+------------+



-- Products with price greater than 1000:
SELECT name, price
FROM products
WHERE price > 1000;
-- +---------------------+---------+
-- | name                | price   |
-- +---------------------+---------+
-- | Mechanical Keyboard | 1299.00 |
-- | Monitor             | 8999.00 |
-- | Webcam              | 1599.00 |
-- | Bluetooth Speaker   | 2499.00 |
-- | Gaming Headset      | 3299.00 |
-- +---------------------+---------+




-- Exact match:
SELECT * FROM products
WHERE name = 'Monitor'
-- +----+---------+---------+-------+-----------+----------------------------+
-- | id | name    | price   | stock | is_active | created_at                 |
-- +----+---------+---------+-------+-----------+----------------------------+
-- | 3  | Monitor | 8999.00 | 10    | true      | 2026-06-17 22:30:53.633386 |
-- +----+---------+---------+-------+-----------+----------------------------+




-- AND — both conditions must be true:
SELECT name, price, stock
FROM products
WHERE price > 500 AND stock > 20;
-- +---------------------+---------+-------+
-- | name                | price   | stock |
-- +---------------------+---------+-------+
-- | Mechanical Keyboard | 1299.00 | 50    |
-- | Bluetooth Speaker   | 2499.00 | 25    |
-- +---------------------+---------+-------+




-- OR — at least one condition must be true:
SELECT name, price
FROM products
WHERE price < 200 OR stock > 100;
-- +------------+--------+
-- | name       | price  |
-- +------------+--------+
-- | Mouse Pad  | 99.00  |
-- | HDMI Cable | 149.00 |
-- +------------+--------+




-- NOT — reverse the condition:
SELECT name, is_active
FROM products
WHERE NOT is_active;
-- +--------------+-----------+
-- | name         | is_active |
-- +--------------+-----------+
-- | Laptop Stand | false     |
-- +--------------+-----------+




-- COMPARISON OPERATORS

-- =    equal
-- !=   not equal (also <>)
-- >    greater than
-- <    less than
-- >=   greater than or equal
-- <=   less than or equal

SELECT name, price FROM products WHERE price != 99.00;
SELECT name, price FROM products WHERE price <> 99.00;  -- same as !=
-- +---------------------+---------+
-- | name                | price   |
-- +---------------------+---------+
-- | Mechanical Keyboard | 1299.00 |
-- | Wireless Mouse      | 499.00  |
-- | Monitor             | 8999.00 |
-- | USB Hub             | 299.00  |
-- | Webcam              | 1599.00 |
-- | Desk Lamp           | 449.00  |
-- | HDMI Cable          | 149.00  |
-- | Laptop Stand        | 899.00  |
-- | Bluetooth Speaker   | 2499.00 |
-- | Gaming Headset      | 3299.00 |
-- +---------------------+---------+





-- 8. BETWEEN — range filter (inclusive)
SELECT name, price
FROM products
WHERE price BETWEEN 400 AND 1500;
-- +---------------------+---------+
-- | name                | price   |
-- +---------------------+---------+
-- | Mechanical Keyboard | 1299.00 |
-- | Wireless Mouse      | 499.00  |
-- | Desk Lamp           | 449.00  |
-- | Laptop Stand        | 899.00  |
-- +---------------------+---------+



-- IN — match against a list of values
SELECT name, city
FROM customers
WHERE city IN ('Pune', 'Mumbai', 'Delhi');



------------------------------------------------------------------------------------------------------------------------

SELECT * FROM customers ;
-- +----+------------+-----------+-------------------+------------+-----+-----------+----------------------------+
-- | id | first_name | last_name | email             | phone      | age | city      | joined_at                  |
-- +----+------------+-----------+-------------------+------------+-----+-----------+----------------------------+
-- | 1  | Akash      | Sharma    | akash@gmail.com   | 9876543210 | 20  | Pune      | 2026-06-17 22:35:13.60936  |
-- | 2  | Riya       | Patel     | riya@gmail.com    | 9812345678 | 22  | Mumbai    | 2026-06-17 22:35:13.60936  |
-- | 3  | Rohit      | Verma     | rohit@gmail.com   | 9898989898 | 25  | Delhi     | 2026-06-17 22:35:13.60936  |
-- | 4  | Sneha      | Kulkarni  | sneha@gmail.com   | 9765432109 | 21  | Nashik    | 2026-06-17 22:35:13.60936  |
-- | 5  | Vikram     | Singh     | vikram@gmail.com  | 9654321098 | 28  | Bangalore | 2026-06-17 22:35:13.60936  |
-- +----+------------+-----------+-------------------+------------+-----+-----------+----------------------------+


-- IN — match against a list of values
SELECT first_name, city
FROM customers
WHERE city IN ('Pune', 'Mumbai', 'Delhi');
-- +------------+--------+
-- | first_name | city   |
-- +------------+--------+
-- | Akash      | Pune   |
-- | Riya       | Mumbai |
-- | Rohit      | Delhi  |
-- +------------+--------+


-- NOT IN — exclude a list:
SELECT first_name, city
FROM customers
WHERE city NOT IN ('Pune', 'Mumbai');
-- +------------+-----------+
-- | first_name | city      |
-- +------------+-----------+
-- | Rohit      | Delhi     |
-- | Sneha      | Nashik    |
-- | Vikram     | Bangalore |
-- +------------+-----------+



-- Products starting with 'W':
SELECT name FROM products WHERE name LIKE 'W%';
-- +----------------+
-- | name           |
-- +----------------+
-- | Wireless Mouse |
-- | Webcam         |
-- +----------------+




-- Products ending with 'e':
SELECT name FROM products WHERE name LIKE '%e';
-- +----------------+
-- | name           |
-- +----------------+
-- | Wireless Mouse |
-- | HDMI Cable     |
-- +----------------+



-- Products containing 'a' anywhere:
SELECT name FROM products WHERE name LIKE '%a%';
-- +---------------------+
-- | name                |
-- +---------------------+
-- | Mechanical Keyboard |
-- | Webcam              |
-- | Desk Lamp           |
-- | Mouse Pad           |
-- | HDMI Cable          |
-- | Laptop Stand        |
-- | Bluetooth Speaker   |
-- | Gaming Headset      |
-- +---------------------+



-- Case insensitive LIKE — use ILIKE (PostgreSQL specific, MySQL doesn't have this):
SELECT name FROM products WHERE name ILIKE '%mouse%';
-- +----------------+
-- | name           |
-- +----------------+
-- | Wireless Mouse |
-- | Mouse Pad      |
-- +----------------+



-- Let's check phone in customers (no default, nullable):
SELECT first_name, phone
FROM customers
WHERE phone IS NULL;
-- +------------+-------+
-- | first_name | phone |
-- +------------+-------+
-- +------------+-------+




-- Opposite — rows where phone IS NOT NULL:
SELECT first_name, phone
FROM customers
WHERE phone IS NOT NULL;
-- +------------+------------+
-- | first_name | phone      |
-- +------------+------------+
-- | Akash      | 9876543210 |
-- | Riya       | 9812345678 |
-- | Rohit      | 9898989898 |
-- | Sneha      | 9765432109 |
-- | Vikram     | 9654321098 |
-- +------------+------------+




SELECT name, price
FROM products
ORDER BY price ASC;
-- +---------------------+---------+
-- | name                | price   |
-- +---------------------+---------+
-- | Mouse Pad           | 99.00   |
-- | HDMI Cable          | 149.00  |
-- | USB Hub             | 299.00  |
-- | Desk Lamp           | 449.00  |
-- | Wireless Mouse      | 499.00  |
-- | Laptop Stand        | 899.00  |
-- | Mechanical Keyboard | 1299.00 |
-- | Webcam              | 1599.00 |
-- | Bluetooth Speaker   | 2499.00 |
-- | Gaming Headset      | 3299.00 |
-- | Monitor             | 8999.00 |
-- +---------------------+---------+





-- Descending (high to low):
SELECT name, price
FROM products
ORDER BY price DESC;
-- +---------------------+---------+
-- | name                | price   |
-- +---------------------+---------+
-- | Monitor             | 8999.00 |
-- | Gaming Headset      | 3299.00 |
-- | Bluetooth Speaker   | 2499.00 |
-- | Webcam              | 1599.00 |
-- | Mechanical Keyboard | 1299.00 |
-- | Laptop Stand        | 899.00  |
-- | Wireless Mouse      | 499.00  |
-- | Desk Lamp           | 449.00  |
-- | USB Hub             | 299.00  |
-- | HDMI Cable          | 149.00  |
-- | Mouse Pad           | 99.00   |
-- +---------------------+---------+




-- Order by multiple columns:
SELECT first_name, city
FROM customers
ORDER BY city ASC, first_name ASC;
-- +------------+-----------+
-- | first_name | city      |
-- +------------+-----------+
-- | Vikram     | Bangalore |
-- | Rohit      | Delhi     |
-- | Riya       | Mumbai    |
-- | Sneha      | Nashik    |
-- | Akash      | Pune      |
-- +------------+-----------+





-- Top 3 most expensive products:
SELECT name, price
FROM products
ORDER BY price DESC
LIMIT 3;
-- +-------------------+---------+
-- | name              | price   |
-- +-------------------+---------+
-- | Monitor           | 8999.00 |
-- | Gaming Headset    | 3299.00 |
-- | Bluetooth Speaker | 2499.00 |
-- +-------------------+---------+





-- Page 1: first 3 products
SELECT name, price
FROM products
ORDER BY id
LIMIT 3 OFFSET 0;
-- +---------------------+---------+
-- | name                | price   |
-- +---------------------+---------+
-- | Mechanical Keyboard | 1299.00 |
-- | Wireless Mouse      | 499.00  |
-- | Monitor             | 8999.00 |
-- +---------------------+---------+




-- Page 2: skip first 3, get next 3
SELECT name, price
FROM products
ORDER BY id
LIMIT 3 OFFSET 3;
-- +----------+---------+
-- | name     | price   |
-- +----------+---------+
-- | USB Hub  | 299.00  |
-- | Webcam   | 1599.00 |
-- | Desk Lamp| 449.00  |
-- +----------+---------+



-- DISTINCT — remove duplicate values
SELECT DISTINCT city FROM customers;
-- +-----------+
-- | city      |
-- +-----------+
-- | Delhi     |
-- | Nashik    |
-- | Bangalore |
-- | Mumbai    |
-- | Pune      |
-- +-----------+


-- COUNT — total rows:
SELECT COUNT(*) AS total_products FROM products;
-- +----------------+
-- | total_products |
-- +----------------+
-- | 11             |
-- +----------------+




-- SUM — add up values:
SELECT SUM(stock) AS total_stock FROM products;
-- +-------------+
-- | total_stock |
-- +-------------+
-- | 587         |
-- +-------------+




-- AVG — average:
SELECT ROUND(AVG(price), 2) AS avg_price FROM products;
-- +-----------+
-- | avg_price |
-- +-----------+
-- | 1826.27   |
-- +-----------+




-- MAX and MIN:
SELECT MAX(price) AS most_expensive,
       MIN(price) AS cheapest
FROM products;
-- +----------------+----------+
-- | most_expensive | cheapest |
-- +----------------+----------+
-- | 8999.00        | 99.00    |
-- +----------------+----------+




SELECT * FROM orders;
-- +----+-------------+------------+----------+------------+------------+
-- | id | customer_id | product_id | quantity | order_date | status     |
-- +----+-------------+------------+----------+------------+------------+
-- | 1  | 1           | 1          | 2        | 2026-06-17 | delivered  |
-- | 2  | 1           | 2          | 1        | 2026-06-17 | delivered  |
-- | 3  | 2           | 3          | 1        | 2026-06-17 | shipped    |
-- | 4  | 3           | 5          | 3        | 2026-06-17 | pending    |
-- | 5  | 4           | 7          | 1        | 2026-06-17 | delivered  |
-- | 6  | 5           | 1          | 1        | 2026-06-17 | pending    |
-- | 7  | 2           | 9          | 2        | 2026-06-17 | shipped    |
-- +----+-------------+------------+----------+------------+------------+




-- GROUP BY — aggregate per group

-- Count orders per customer:
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC;
-- +-------------+--------------+
-- | customer_id | total_orders |
-- +-------------+--------------+
-- | 2           | 2            |
-- | 1           | 2            |
-- | 3           | 1            |
-- | 5           | 1            |
-- | 4           | 1            |
-- +-------------+--------------+





-- Total stock per active status:
SELECT is_active, COUNT(*) AS count, SUM(stock) AS total_stock
FROM products
GROUP BY is_active;
-- +-----------+-------+-------------+
-- | is_active | count | total_stock |
-- +-----------+-------+-------------+
-- | false     | 1     | 15          |
-- | true      | 10    | 572         |
-- +-----------+-------+-------------+






-- Customers who placed more than 1 order:
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;
-- +-------------+--------------+
-- | customer_id | total_orders |
-- +-------------+--------------+
-- | 2           | 2            |
-- | 1           | 2            |
-- +-------------+--------------+






-- UPPER, LOWER:
SELECT UPPER(first_name), LOWER(email)
FROM customers;
-- +--------+------------------+
-- | upper  | lower            |
-- +--------+------------------+
-- | AKASH  | akash@gmail.com  |
-- | RIYA   | riya@gmail.com   |
-- | ROHIT  | rohit@gmail.com  |
-- | SNEHA  | sneha@gmail.com  |
-- | VIKRAM | vikram@gmail.com |
-- +--------+------------------+






-- CONCAT — join strings:
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM customers;
-- +---------------+
-- | full_name     |
-- +---------------+
-- | Akash Sharma  |
-- | Riya Patel    |
-- | Rohit Verma   |
-- | Sneha Kulkarni|
-- | Vikram Singh  |
-- +---------------+





-- LENGTH — string length:
SELECT name, LENGTH(name) AS name_length
FROM products
ORDER BY name_length DESC;
-- +----------------+
-- | full_name      |
-- +----------------+
-- | Akash Sharma   |
-- | Riya Patel     |
-- | Rohit Verma    |
-- | Sneha Kulkarni |
-- | Vikram Singh   |
-- +----------------+








-- TRIM — remove spaces:
SELECT TRIM('   hello world   ');
-- +-------------+
-- | btrim       |
-- +-------------+
-- | hello world |
-- +-------------+




-- USEFUL NUMERIC FUNCTIONS
SELECT ROUND(3.14159, 2);    -- 3.14  (round to 2 decimals)
SELECT CEIL(4.1);            -- 5     (round up always)
SELECT FLOOR(4.9);           -- 4     (round down always)
SELECT ABS(-50);             -- 50    (absolute value)
SELECT MOD(10, 3);           -- 1     (remainder, like % in code)




-- USEFUL DATE FUNCTIONS
-- Current date and time:
SELECT CURRENT_DATE;       -- 2026-06-17
SELECT CURRENT_TIME;       -- 23:40:11.373178+05:30
SELECT CURRENT_TIMESTAMP;  -- 2026-06-17 23:40:22.935926+05:30
SELECT NOW();              --2026-06-17 23:40:33.523564+05:30  [same as CURRENT_TIMESTAMP]




-- Extract part of a date:
SELECT EXTRACT(YEAR  FROM joined_at) AS join_year,
       EXTRACT(MONTH FROM joined_at) AS join_month,
       first_name
FROM customers;
-- +-----------+------------+------------+
-- | join_year | join_month | first_name |
-- +-----------+------------+------------+
-- | 2026      | 6          | Akash      |
-- | 2026      | 6          | Riya       |
-- | 2026      | 6          | Rohit      |
-- | 2026      | 6          | Sneha      |
-- | 2026      | 6          | Vikram     |
-- +-----------+------------+------------+





-- Age calculation:
SELECT first_name,
       AGE(NOW(), joined_at) AS time_since_joining
FROM customers;
-- +------------+-----------------+
-- | first_name | time_since_joining |
-- +------------+-----------------+
-- | Akash      | 01:06:49.162846 |
-- | Riya       | 01:06:49.162846 |
-- | Rohit      | 01:06:49.162846 |
-- | Sneha      | 01:06:49.162846 |
-- | Vikram     | 01:06:49.162846 |
-- +------------+-----------------+





-- Convert price (numeric) to integer:
SELECT name, CAST(price AS INTEGER) AS rounded_price
FROM products;
-- +---------------------+---------------+
-- | name                | rounded_price |
-- +---------------------+---------------+
-- | Mechanical Keyboard | 1299          |
-- | Wireless Mouse      | 499           |
-- | Monitor             | 8999          |
-- | USB Hub             | 299           |
-- | Webcam              | 1599          |
-- | Desk Lamp           | 449           |
-- | Mouse Pad           | 99            |
-- | HDMI Cable          | 149           |
-- | Laptop Stand        | 899           |
-- | Bluetooth Speaker   | 2499          |
-- | Gaming Headset      | 3299          |
-- +---------------------+---------------+





-- Short syntax using :: (PostgreSQL specific):
SELECT name, price::INTEGER AS rounded_price
FROM products;
-- +---------------------+---------------+
-- | name                | rounded_price |
-- +---------------------+---------------+
-- | Mechanical Keyboard | 1299          |
-- | Wireless Mouse      | 499           |
-- | Monitor             | 8999          |
-- | USB Hub             | 299           |
-- | Webcam              | 1599          |
-- | Desk Lamp           | 449           |
-- | Mouse Pad           | 99            |
-- | HDMI Cable          | 149           |
-- | Laptop Stand        | 899           |
-- | Bluetooth Speaker   | 2499          |
-- | Gaming Headset      | 3299          |
-- +---------------------+---------------+





-- CASE — if/else inside SELECT

SELECT name,
       price,
       CASE
           WHEN price < 500  THEN 'Budget'
           WHEN price < 1500 THEN 'Mid Range'
           WHEN price < 3000 THEN 'Premium'
           ELSE                   'Luxury'
       END AS category
FROM products
ORDER BY price;
-- +---------------------+---------+-----------+
-- | name                | price   | category  |
-- +---------------------+---------+-----------+
-- | Mouse Pad           | 99.00   | Budget    |
-- | HDMI Cable          | 149.00  | Budget    |
-- | USB Hub             | 299.00  | Budget    |
-- | Desk Lamp           | 449.00  | Budget    |
-- | Wireless Mouse      | 499.00  | Budget    |
-- | Laptop Stand        | 899.00  | Mid Range |
-- | Mechanical Keyboard | 1299.00 | Mid Range |
-- | Webcam              | 1599.00 | Premium   |
-- | Bluetooth Speaker   | 2499.00 | Premium   |
-- | Gaming Headset      | 3299.00 | Luxury    |
-- | Monitor             | 8999.00 | Luxury    |
-- +---------------------+---------+-----------+

