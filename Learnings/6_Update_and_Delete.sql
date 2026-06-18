-- HERE WE ARE USING OLD TABLE "products"
-- refer all old files of sql


SELECT id, name, price, stock, is_active
FROM products
ORDER BY id;
-- +----+---------------------+---------+-------+-----------+
-- | id | name                | price   | stock | is_active |
-- +----+---------------------+---------+-------+-----------+
-- | 1  | Mechanical Keyboard | 1299.00 | 50    | true      |
-- | 2  | Wireless Mouse      | 499.00  | 30    | true      |
-- | 3  | Monitor             | 8999.00 | 10    | true      |
-- | 4  | USB Hub             | 299.00  | 100   | true      |
-- | 5  | Webcam              | 1599.00 | 20    | true      |
-- | 6  | Desk Lamp           | 449.00  | 45    | true      |
-- | 7  | Mouse Pad           | 99.00   | 200   | true      |
-- | 8  | HDMI Cable          | 149.00  | 80    | true      |
-- | 9  | Laptop Stand        | 899.00  | 15    | false     |
-- | 10 | Bluetooth Speaker   | 2499.00 | 25    | true      |
-- | 11 | Gaming Headset      | 3299.00 | 12    | true      |
-- +----+---------------------+---------+-------+-----------+




-- BASIC UPDATE — change one column in one row

-- STEP 1 : always SELECT first to confirm you are targeting right row
SELECT id, name, price FROM products WHERE id = 2;
-- +----+----------------+--------+
-- | id | name           | price  |
-- +----+----------------+--------+
-- | 2  | Wireless Mouse | 499.00 |
-- +----+----------------+--------+




-- STEP 2 : now run the UPDATE
UPDATE products
SET price = 599.00
WHERE id = 2;

-- UPDATE 1
-- Query returned successfully in 125 msec.




-- STEP 3 : verify the change
SELECT id, name, price FROM products WHERE id = 2;
-- +----+----------------+--------+
-- | id | name           | price  |
-- +----+----------------+--------+
-- | 2  | Wireless Mouse | 599.00 |
-- +----+----------------+--------+





UPDATE products
SET price     = 1699.00,
    stock     = 25,
    is_active = TRUE
WHERE id = 9;
-- UPDATE 1
-- Query returned successfully in 78 msec.




-- Verify:
SELECT id, name, price, stock, is_active
FROM products
WHERE id = 9;
-- +----+--------------+---------+-------+-----------+
-- | id | name         | price   | stock | is_active |
-- +----+--------------+---------+-------+-----------+
-- | 9  | Laptop Stand | 1699.00 | 25    | true      |
-- +----+--------------+---------+-------+-----------+





-- Apply 10% discount to all products with price > 2000

SELECT id, name, price
FROM products
WHERE price > 2000;
-- +----+-------------------+---------+
-- | id | name              | price   |
-- +----+-------------------+---------+
-- | 3  | Monitor           | 8999.00 |
-- | 10 | Bluetooth Speaker | 2499.00 |
-- | 11 | Gaming Headset    | 3299.00 |
-- +----+-------------------+---------+




UPDATE products
SET price = ROUND(price * 0.90, 2)   -- multiply by 0.90 = 10% off
WHERE price > 2000;




SELECT id, name, price FROM products WHERE id IN (3, 10, 11);
-- +----+-------------------+---------+
-- | id | name              | price   |
-- +----+-------------------+---------+
-- | 3  | Monitor           | 8099.10 |
-- | 10 | Bluetooth Speaker | 2249.10 |
-- | 11 | Gaming Headset    | 2969.10 |
-- +----+-------------------+---------+






-- Increase stock of all active products by 5, see results immediately
UPDATE products
SET stock = stock + 5
WHERE is_active = TRUE
RETURNING id, name, stock;
-- +----+---------------------+-------+
-- | id | name                | stock |
-- +----+---------------------+-------+
-- | 1  | Mechanical Keyboard | 55    |
-- | 4  | USB Hub             | 105   |
-- | 5  | Webcam              | 25    |
-- | 6  | Desk Lamp           | 50    |
-- | 7  | Mouse Pad           | 205   |
-- | 8  | HDMI Cable          | 85    |
-- | 2  | Wireless Mouse      | 35    |
-- | 9  | Laptop Stand        | 30    |
-- | 3  | Monitor             | 15    |
-- | 10 | Bluetooth Speaker   | 30    |
-- | 11 | Gaming Headset      | 17    |
-- +----+---------------------+-------+







-- Give different discounts based on price range in one query
UPDATE products
SET price = CASE
                WHEN price > 2000 THEN ROUND(price * 0.85, 2)  -- 15% off luxury
                WHEN price > 500  THEN ROUND(price * 0.90, 2)  -- 10% off mid
                ELSE              ROUND(price * 0.95, 2)        --  5% off budget
            END
RETURNING id, name, price;
-- +----+---------------------+---------+
-- | id | name                | price   |
-- +----+---------------------+---------+
-- | 1  | Mechanical Keyboard | 1052.19 |
-- | 4  | USB Hub             | 269.85  |
-- | 5  | Webcam              | 1295.19 |
-- | 6  | Desk Lamp           | 405.22  |
-- | 7  | Mouse Pad           | 89.35   |
-- | 8  | HDMI Cable          | 134.47  |
-- | 2  | Wireless Mouse      | 485.19  |
-- | 9  | Laptop Stand        | 1376.19 |
-- | 3  | Monitor             | 5851.60 |
-- | 10 | Bluetooth Speaker   | 1720.57 |
-- | 11 | Gaming Headset      | 2145.18 |
-- +----+---------------------+---------+





-- Customers table: update city to UPPER case
UPDATE customers
SET city = UPPER(city)
RETURNING id, first_name, city;
-- +----+------------+-----------+
-- | id | first_name | city      |
-- +----+------------+-----------+
-- | 1  | Akash      | PUNE      |
-- | 2  | Riya       | MUMBAI    |
-- | 3  | Rohit      | DELHI     |
-- | 4  | Sneha      | NASHIK    |
-- | 5  | Vikram     | BANGALORE |
-- +----+------------+-----------+






-- First insert a test row so we have something to delete safely:
INSERT INTO products (name, price, stock)
VALUES ('Test Product', 1.00, 0)
RETURNING id, name;
-- +----+--------------+
-- | id | name         |
-- +----+--------------+
-- | 13 | Test Product |
-- +----+--------------+




-- Confirm before deleting:
SELECT id, name FROM products WHERE id = 12;
-- +----+--------------+
-- | id | name         |
-- +----+--------------+
-- | 12 | Test Product |
-- +----+--------------+




-- Verify it is gone:
SELECT id, name FROM products WHERE id = 12;
-- +----+------+
-- | id | name |
-- +----+------+
-- +----+------+




-- First insert some test rows:
INSERT INTO products (name, price, stock, is_active)
VALUES
    ('Expired Item 1', 1.00, 0, FALSE),
    ('Expired Item 2', 1.00, 0, FALSE),
    ('Expired Item 3', 1.00, 0, FALSE)
RETURNING id, name;
-- +----+----------------+
-- | id | name           |
-- +----+----------------+
-- | 13 | Expired Item 1 |
-- | 14 | Expired Item 2 |
-- | 15 | Expired Item 3 |
-- +----+----------------+





-- Delete all inactive products with zero stock:
DELETE FROM products
WHERE is_active = FALSE AND stock = 0;

-- Output:
-- DELETE 3   ← 3 rows removed




-- Verify:
SELECT id, name, is_active, stock
FROM products
WHERE is_active = FALSE;
-- +----+------+-----------+-------+
-- | id | name | is_active | stock |
-- +----+------+-----------+-------+
-- +----+------+-----------+-------+





-- Insert and delete in one flow with RETURNING:
INSERT INTO products (name, price, stock)
VALUES ('Discontinued Item', 50.00, 0);

DELETE FROM products
WHERE name = 'Discontinued Item'
RETURNING id, name, price;
-- +----+-------------------+-------+
-- | id | name              | price |
-- +----+-------------------+-------+
-- | 16 | Discontinued Item | 50.00 |
-- +----+-------------------+-------+









-- Insert 3 test rows:
INSERT INTO products (name, price, stock)
VALUES
    ('Old Model A', 100.00, 0),
    ('Old Model B', 100.00, 0),
    ('Old Model C', 100.00, 0)
RETURNING id, name;
-- +----+-------------+
-- | id | name        |
-- +----+-------------+
-- | 22 | Old Model A |
-- | 23 | Old Model B |
-- | 24 | Old Model C |
-- +----+-------------+




-- Delete them all by id list:
DELETE FROM products
WHERE id IN (17, 18, 19)
RETURNING id, name;
-- +----+------+
-- | id | name |
-- +----+------+
-- +----+------+






--  WHAT HAPPENS WHEN FOREIGN KEY BLOCKS DELETE

-- Try to delete a customer who has orders:
DELETE FROM customers WHERE id = 1;

-- Output (ERROR):
-- ERROR:  update or delete on table "customers" violates foreign key
--         constraint "orders_customer_id_fkey" on table "orders"


-- DETAIL:  Key (id)=(1) is still referenced from table "orders".
-- PostgreSQL blocked the delete because orders table still
-- has rows pointing to customer id = 1.
-- You must delete child rows (orders) first, then parent (customer).




-- Correct order:
DELETE FROM orders      WHERE customer_id = 1;  -- delete orders first
DELETE FROM customers   WHERE id = 1;           -- then delete customer

-- Output:
-- DELETE 2   ← 2 orders removed
-- DELETE 1   ← 1 customer removed




-- see whole table of products , to make changes 
SELECT id, name, price FROM products ;
-- +----+---------------------+---------+
-- | id | name                | price   |
-- +----+---------------------+---------+
-- | 1  | Mechanical Keyboard | 1052.19 |
-- | 4  | USB Hub             | 269.85  |
-- | 5  | Webcam              | 1295.19 |
-- | 6  | Desk Lamp           | 405.22  |
-- | 7  | Mouse Pad           | 89.35   |
-- | 8  | HDMI Cable          | 134.47  |
-- | 2  | Wireless Mouse      | 485.19  |
-- | 9  | Laptop Stand        | 1376.19 |
-- | 3  | Monitor             | 5851.60 |
-- | 10 | Bluetooth Speaker   | 1720.57 |
-- | 11 | Gaming Headset      | 2145.18 |
-- | 22 | Old Model A         | 100.00  |
-- | 23 | Old Model B         | 100.00  |
-- | 24 | Old Model C         | 100.00  |
-- +----+---------------------+---------+





BEGIN;

    -- Make a risky update:
    UPDATE products SET price = 0 WHERE id = 3;


    -- Check what happened:
    SELECT id, name, price FROM products WHERE id = 3;
    -- +----+---------+-------+
    -- | id | name    | price |
    -- +----+---------+-------+
    -- | 3  | Monitor | 0.00  |
    -- +----+---------+-------+

    -- Looks wrong! Undo everything:
ROLLBACK;




-- Verify price is restored:
SELECT id, name, price FROM products WHERE id = 3;
-- +----+---------+---------+
-- | id | name    | price   |
-- +----+---------+---------+
-- | 3  | Monitor | 5851.60 |
-- +----+---------+---------+







-- TRUNCATE — wipe entire table instantly


-- Create a temp table to demonstrate:
CREATE TABLE temp_logs (
    id      SERIAL PRIMARY KEY,
    message TEXT
);





INSERT INTO temp_logs (message)
VALUES ('log 1'), ('log 2'), ('log 3');





SELECT COUNT(*) FROM temp_logs;
-- +-------+
-- | count |
-- +-------+
-- |   3   |
-- +-------+





-- TRUNCATE removes all rows, resets SERIAL counter:
TRUNCATE TABLE temp_logs;





SELECT COUNT(*) FROM temp_logs;
-- +-------+
-- | count |
-- +-------+
-- |   0   |
-- +-------+





-- Difference between DELETE and TRUNCATE:
-- DELETE FROM temp_logs;  → removes rows one by one, SERIAL counter continues
-- TRUNCATE temp_logs;     → wipes entire table, SERIAL resets to 1
-- TRUNCATE is much faster on large tables
-- TRUNCATE cannot have a WHERE clause

-- Reset SERIAL counter without truncate:
-- TRUNCATE temp_logs RESTART IDENTITY;

DROP TABLE temp_logs;