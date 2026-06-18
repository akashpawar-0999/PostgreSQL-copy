




SELECT id, first_name, city FROM customers;
-- +----+------------+-----------+
-- | id | first_name | city      |
-- +----+------------+-----------+
-- | 2  | Riya       | Mumbai    |
-- | 3  | Rohit      | Delhi     |
-- | 4  | Sneha      | Nashik    |
-- | 5  | Vikram     | Bangalore |
-- +----+------------+-----------+




SELECT id, name, price FROM products ORDER BY id LIMIT 5;
-- +----+---------------------+---------+
-- | id | name                | price   |
-- +----+---------------------+---------+
-- | 1  | Mechanical Keyboard | 1052.19 |
-- | 2  | Wireless Mouse      | 485.19  |
-- | 3  | Monitor             | 5851.60 |
-- | 4  | USB Hub             | 269.85  |
-- | 5  | Webcam              | 1295.19 |
-- +----+---------------------+---------+









SELECT id, customer_id, product_id, quantity, status FROM orders;
-- +----+-------------+------------+----------+-----------+
-- | id | customer_id | product_id | quantity | status    |
-- +----+-------------+------------+----------+-----------+
-- | 3  | 2           | 3          | 1        | shipped   |
-- | 4  | 3           | 5          | 3        | pending   |
-- | 5  | 4           | 7          | 1        | delivered |
-- | 6  | 5           | 1          | 1        | pending   |
-- | 7  | 2           | 9          | 2        | shipped   |
-- +----+-------------+------------+----------+-----------+





-- INNER JOIN
-- Returns ONLY rows where match exists in BOTH tables

-- Syntax:
-- SELECT cols
-- FROM   left_table
-- JOIN   right_table ON left_table.col = right_table.col


SELECT o.id          AS order_id,
       c.first_name  AS customer,
       o.quantity,
       o.status
FROM   orders    o                        -- "o" is alias for orders
JOIN   customers c ON o.customer_id = c.id  -- match customer_id to customers.id
ORDER BY o.id;
-- +----+-------------+------------+----------+-----------+
-- | id | customer_id | product_id | quantity | status    |
-- +----+-------------+------------+----------+-----------+
-- | 3  | 2           | 3          | 1        | shipped   |
-- | 4  | 3           | 5          | 3        | pending   |
-- | 5  | 4           | 7          | 1        | delivered |
-- | 6  | 5           | 1          | 1        | pending   |
-- | 7  | 2           | 9          | 2        | shipped   |
-- +----+-------------+------------+----------+-----------+








-- JOIN THREE TABLES — orders + customers + products


SELECT o.id            AS order_id,
       c.first_name    AS customer,
       p.name          AS product,
       p.price,
       o.quantity,
       o.quantity * p.price  AS order_total,
       o.status
FROM   orders    o
JOIN   customers c ON o.customer_id = c.id   -- connect orders to customers
JOIN   products  p ON o.product_id  = p.id   -- connect orders to products
ORDER BY o.id;
-- +----------+----------+---------------------+---------+----------+-------------+-----------+
-- | order_id | customer | product             | price   | quantity | order_total | status    |
-- +----------+----------+---------------------+---------+----------+-------------+-----------+
-- | 3        | Riya     | Monitor             | 5851.60 | 1        | 5851.60     | shipped   |
-- | 4        | Rohit    | Webcam              | 1295.19 | 3        | 3885.57     | pending   |
-- | 5        | Sneha    | Mouse Pad           | 89.35   | 1        | 89.35       | delivered |
-- | 6        | Vikram   | Mechanical Keyboard | 1052.19 | 1        | 1052.19     | pending   |
-- | 7        | Riya     | Laptop Stand        | 1376.19 | 2        | 2752.38     | shipped   |
-- +----------+----------+---------------------+---------+----------+-------------+-----------+












-- INNER JOIN WITH AGGREGATE

-- Total amount spent per customer:
SELECT c.first_name             AS customer,
       COUNT(o.id)              AS total_orders,
       SUM(o.quantity * p.price) AS total_spent
FROM   orders    o
JOIN   customers c ON o.customer_id = c.id
JOIN   products  p ON o.product_id  = p.id
GROUP BY c.first_name
ORDER BY total_spent DESC;
-- +----------+-------------+------------+
-- | customer | totalOrders | total_spent|
-- +----------+-------------+------------+
-- | Riya     | 2           | 8603.98    |
-- | Rohit    | 1           | 3885.57    |
-- | Vikram   | 1           | 1052.19    |
-- | Sneha    | 1           | 89.35      |
-- +----------+-------------+------------+







-- LEFT JOIN
-- Returns ALL rows from LEFT table
-- + matched rows from RIGHT table
-- Unmatched right side shows NULL



-- LEFT JOIN — all customers, with or without orders

-- Insert a new customer with NO orders to demonstrate:
INSERT INTO customers (first_name, last_name, email, age, city)
VALUES ('Priya', 'Nair', 'priya@gmail.com', 23, 'Chennai');



SELECT c.id,
       c.first_name  AS customer,
       o.id          AS order_id,
       o.status
FROM   customers c                              -- LEFT table (all rows returned)
LEFT JOIN orders o ON c.id = o.customer_id      -- RIGHT table (NULL if no match)
ORDER BY c.id;
-- +----+----------+----------+-----------+
-- | id | customer | order_id | status    |
-- +----+----------+----------+-----------+
-- | 2  | Riya     | 3        | shipped   |
-- | 2  | Riya     | 7        | shipped   |
-- | 3  | Rohit    | 4        | pending   |
-- | 4  | Sneha    | 5        | delivered |
-- | 5  | Vikram   | 6        | pending   |
-- | 8  | Priya    | NULL     | NULL      |
-- +----+----------+----------+-----------+




-- INNER JOIN would have excluded Priya completely.
-- LEFT JOIN includes her with NULL for order columns.






SELECT c.id,
       c.first_name  AS customer_with_no_orders
FROM   customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE  o.id IS NULL;          -- only rows with no matching order
-- +----+------------------------+
-- | id | customer_with_no_orders|
-- +----+------------------------+
-- | 8  | Priya                  |
-- +----+------------------------+





SELECT p.id,
       p.name  AS product_never_ordered
FROM   products  p
LEFT JOIN orders o ON p.id = o.product_id
WHERE  o.id IS NULL
ORDER BY p.id;
-- +----+---------------------+
-- | id | product_never_ordered |
-- +----+---------------------+
-- | 2  | Wireless Mouse      |
-- | 4  | USB Hub             |
-- | 6  | Desk Lamp           |
-- | 8  | HDMI Cable          |
-- | 10 | Bluetooth Speaker   |
-- | 11 | Gaming Headset      |
-- | 22 | Old Model A         |
-- | 23 | Old Model B         |
-- | 24 | Old Model C         |
-- +----+---------------------+






-- RIGHT JOIN
-- Returns ALL rows from RIGHT table
-- + matched rows from LEFT table
-- Unmatched left side shows NULL


-- RIGHT JOIN — all products, with or without orders

SELECT p.name        AS product,
       o.id          AS order_id,
       o.quantity
FROM   orders    o                              -- LEFT table
RIGHT JOIN products  p ON o.product_id = p.id  -- RIGHT table (all rows)
ORDER BY p.id;
-- +---------------------+----------+----------+
-- | product             | order_id | quantity |
-- +---------------------+----------+----------+
-- | Mechanical Keyboard | 6        | 1        |
-- | Wireless Mouse      | NULL     | NULL     |
-- | Monitor             | 3        | 1        |
-- | USB Hub             | NULL     | NULL     |
-- | Webcam              | 4        | 3        |
-- | Desk Lamp           | NULL     | NULL     |
-- | Mouse Pad           | 5        | 1        |
-- | HDMI Cable          | NULL     | NULL     |
-- | Laptop Stand        | 7        | 2        |
-- | Bluetooth Speaker   | NULL     | NULL     |
-- | Gaming Headset      | NULL     | NULL     |
-- | Old Model A         | NULL     | NULL     |
-- | Old Model B         | NULL     | NULL     |
-- | Old Model C         | NULL     | NULL     |
-- +---------------------+----------+----------+







-- FULL JOIN (FULL OUTER JOIN)
-- Returns ALL rows from BOTH tables
-- NULLs where no match exists on either side

SELECT c.first_name  AS customer,
       o.id          AS order_id,
       o.status
FROM   customers  c
FULL JOIN orders  o ON c.id = o.customer_id
ORDER BY c.first_name NULLS LAST;
-- +----------+----------+-----------+
-- | customer | order_id | status    |
-- +----------+----------+-----------+
-- | Priya    | NULL     | NULL      |
-- | Riya     | 3        | shipped   |
-- | Riya     | 7        | shipped   |
-- | Rohit    | 4        | pending   |
-- | Sneha    | 5        | delivered |
-- | Vikram   | 6        | pending   |
-- +----------+----------+-----------+










-- CROSS JOIN
-- Every row from left × every row from right
-- No ON condition needed
-- Result = left_rows × right_rows


-- Example: generate all possible customer + city combinations
-- with a small cities table

CREATE TABLE cities (city VARCHAR(50));
INSERT INTO cities VALUES ('Pune'), ('Mumbai'), ('Delhi');

SELECT c.first_name, ct.city
FROM customers c
CROSS JOIN cities ct
ORDER BY c.first_name, ct.city;
-- +------------+--------+
-- | first_name | city   |
-- +------------+--------+
-- | Priya      | Delhi  |
-- | Priya      | Mumbai |
-- | Priya      | Pune   |
-- | Riya       | Delhi  |
-- | Riya       | Mumbai |
-- | Riya       | Pune   |
-- | Rohit      | Delhi  |
-- | Rohit      | Mumbai |
-- | Rohit      | Pune   |
-- | Sneha      | Delhi  |
-- | Sneha      | Mumbai |
-- | Sneha      | Pune   |
-- | Vikram     | Delhi  |
-- | Vikram     | Mumbai |
-- | Vikram     | Pune   |
-- +------------+--------+




DROP TABLE cities;




-- SELF JOIN
-- Table joined with itself
-- Used for hierarchical data (employee → manager)





CREATE TABLE staff_members (
    id         SERIAL        PRIMARY KEY,
    name       VARCHAR(100)  NOT NULL,
    manager_id INTEGER       REFERENCES staff_members(id)  -- FK to same table
);





INSERT INTO staff_members (name, manager_id) VALUES
    ('Arjun',   NULL),   -- id=1, CEO, no manager
    ('Priya',   1),      -- id=2, reports to Arjun
    ('Rahul',   1),      -- id=3, reports to Arjun
    ('Sneha',   2),      -- id=4, reports to Priya
    ('Vikram',  2),      -- id=5, reports to Priya
    ('Rohan',   3);      -- id=6, reports to Rahul





-- Self join: employee table joined with itself to get manager name
SELECT e.name    AS employee,
       m.name    AS manager
FROM   staff_members  e                           -- e = employee
LEFT JOIN staff_members m ON e.manager_id = m.id  -- m = manager (same table)
ORDER BY m.name NULLS FIRST;
-- +----------+---------+
-- | employee | manager |
-- +----------+---------+
-- | Arjun    | NULL    |
-- | Priya    | Arjun   |
-- | Rahul    | Arjun   |
-- | Sneha    | Priya   |
-- | Vikram   | Priya   |
-- | Rohan    | Rahul   |
-- +----------+---------+



DROP TABLE staff_members;





-- PRACTICAL REAL WORLD QUERIES


-- ORDER SUMMARY REPORT


SELECT o.id                          AS order_id,
       c.first_name                  AS customer,
       c.city,
       p.name                        AS product,
       o.quantity,
       p.price                       AS unit_price,
       ROUND(o.quantity * p.price,2) AS total,
       o.order_date,
       o.status
FROM   orders    o
JOIN   customers c ON o.customer_id = c.id
JOIN   products  p ON o.product_id  = p.id
ORDER BY o.order_date DESC, o.id;
-- +----------+----------+-----------+---------------------+----------+------------+-------------+------------+-----------+
-- | order_id | customer | city      | product             | quantity | unit_price | total       | order_date | status    |
-- +----------+----------+-----------+---------------------+----------+------------+-------------+------------+-----------+
-- | 3        | Riya     | Mumbai    | Monitor             | 1        | 5851.60    | 5851.60     | 2026-06-17 | shipped   |
-- | 4        | Rohit    | Delhi     | Webcam              | 3        | 1295.19    | 3885.57     | 2026-06-17 | pending   |
-- | 5        | Sneha    | Nashik    | Mouse Pad           | 1        | 89.35      | 89.35       | 2026-06-17 | delivered |
-- | 6        | Vikram   | Bangalore | Mechanical Keyboard | 1        | 1052.19    | 1052.19     | 2026-06-17 | pending   |
-- | 7        | Riya     | Mumbai    | Laptop Stand        | 2        | 1376.19    | 2752.38     | 2026-06-17 | shipped   |
-- +----------+----------+-----------+---------------------+----------+------------+-------------+------------+-----------+








-- CUSTOMER PURCHASE SUMMARY

SELECT c.first_name                   AS customer,
       c.city,
       COUNT(o.id)                    AS total_orders,
       COALESCE(SUM(o.quantity), 0)   AS total_items,
       COALESCE(
           ROUND(SUM(o.quantity * p.price), 2)
       , 0)                           AS total_spent
FROM   customers c
LEFT JOIN orders   o ON c.id        = o.customer_id
LEFT JOIN products p ON o.product_id = p.id
GROUP BY c.id, c.first_name, c.city
ORDER BY total_spent DESC;
-- +----------+-----------+-------------+------------+------------+
-- | customer | city      | totalOrders | totalItems | total_spent|
-- +----------+-----------+-------------+------------+------------+
-- | Riya     | Mumbai    | 2           | 3          | 8603.98    |
-- | Rohit    | Delhi     | 1           | 3          | 3885.57    |
-- | Vikram   | Bangalore | 1           | 1          | 1052.19    |
-- | Sneha    | Nashik    | 1           | 1          | 89.35      |
-- | Priya    | Chennai   | 0           | 0          | 0          |
-- +----------+-----------+-------------+------------+------------+







-- MOST POPULAR PRODUCTS BY ORDER COUNT


SELECT p.name                  AS product,
       p.price,
       COUNT(o.id)             AS times_ordered,
       SUM(o.quantity)         AS total_qty_sold,
       ROUND(
           SUM(o.quantity * p.price)
       , 2)                    AS revenue
FROM   products p
LEFT JOIN orders o ON p.id = o.product_id
GROUP BY p.id, p.name, p.price
ORDER BY times_ordered DESC, revenue DESC;
-- +---------------------+---------+---------------+----------------+---------+
-- | product             | price   | times_ordered | total_qty_sold | revenue |
-- +---------------------+---------+---------------+----------------+---------+
-- | Monitor             | 5851.60 | 1             | 1              | 5851.60 |
-- | Webcam              | 1295.19 | 1             | 3              | 3885.57 |
-- | Laptop Stand        | 1376.19 | 1             | 2              | 2752.38 |
-- | Mechanical Keyboard | 1052.19 | 1             | 1              | 1052.19 |
-- | Mouse Pad           | 89.35   | 1             | 1              | 89.35   |
-- | Old Model B         | 100.00  | 0             | NULL           | NULL    |
-- | Old Model A         | 100.00  | 0             | NULL           | NULL    |
-- | HDMI Cable          | 134.47  | 0             | NULL           | NULL    |
-- | Old Model C         | 100.00  | 0             | NULL           | NULL    |
-- | Gaming Headset      | 2145.18 | 0             | NULL           | NULL    |
-- | Bluetooth Speaker   | 1720.57 | 0             | NULL           | NULL    |
-- | Wireless Mouse      | 485.19  | 0             | NULL           | NULL    |
-- | Desk Lamp           | 405.22  | 0             | NULL           | NULL    |
-- | USB Hub             | 269.85  | 0             | NULL           | NULL    |
-- +---------------------+---------+---------------+----------------+---------+






-- USING ALIASES CLEARLY — table alias rules

-- Table aliases make JOIN queries readable.
-- You define alias right after table name: FROM orders o
-- Then use alias everywhere: o.id, o.status



-- Without aliases (hard to read):
SELECT orders.id, customers.first_name, products.name
FROM orders
JOIN customers ON orders.customer_id = customers.id
JOIN products  ON orders.product_id  = products.id;
-- +----+------------+---------------------+
-- | id | first_name | name                |
-- +----+------------+---------------------+
-- | 3  | Riya       | Monitor             |
-- | 4  | Rohit      | Webcam              |
-- | 5  | Sneha      | Mouse Pad           |
-- | 6  | Vikram     | Mechanical Keyboard |
-- | 7  | Riya       | Laptop Stand        |
-- +----+------------+---------------------+






-- With aliases (clean and readable):
SELECT o.id, c.first_name, p.name
FROM   orders    o
JOIN   customers c ON o.customer_id = c.id
JOIN   products  p ON o.product_id  = p.id;
-- +----+------------+---------------------+
-- | id | first_name | name                |
-- +----+------------+---------------------+
-- | 3  | Riya       | Monitor             |
-- | 4  | Rohit      | Webcam              |
-- | 5  | Sneha      | Mouse Pad           |
-- | 6  | Vikram     | Mechanical Keyboard |
-- | 7  | Riya       | Laptop Stand        |
-- +----+------------+---------------------+







-- COALESCE — replace NULL in JOIN results

-- COALESCE(value, fallback) returns first non-NULL value.
-- Useful to show something meaningful instead of NULL.







SELECT c.first_name                          AS customer,
       COALESCE(o.status, 'No orders yet')   AS order_status
FROM   customers c
LEFT JOIN orders o ON c.id = o.customer_id
ORDER BY c.first_name;
-- +----------+----------------+
-- | customer | order_status   |
-- +----------+----------------+
-- | Priya    | No orders yet  |
-- | Riya     | shipped        |
-- | Riya     | shipped        |
-- | Rohit    | pending        |
-- | Sneha    | delivered      |
-- | Vikram   | pending        |
-- +----------+----------------+
