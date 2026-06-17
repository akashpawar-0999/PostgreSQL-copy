
CREATE TABLE products (
    id          SERIAL         PRIMARY KEY,
    name        VARCHAR(100)   NOT NULL,
    price       NUMERIC(10,2)  NOT NULL,
    stock       INTEGER        DEFAULT 0,
    is_active   BOOLEAN        DEFAULT TRUE,
    created_at  TIMESTAMP      DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE customers (
    id         SERIAL        PRIMARY KEY,
    first_name VARCHAR(50)   NOT NULL,
    last_name  VARCHAR(50)   NOT NULL,
    email      VARCHAR(200)  NOT NULL UNIQUE,
    phone      VARCHAR(15),
    age        INTEGER       CHECK (age >= 18),
    city       VARCHAR(100)  DEFAULT 'Unknown',
    joined_at  TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    id          SERIAL      PRIMARY KEY,
    customer_id INTEGER     NOT NULL REFERENCES customers(id),
    product_id  INTEGER     NOT NULL REFERENCES products(id),
    quantity    INTEGER     NOT NULL CHECK (quantity > 0),
    order_date  DATE        DEFAULT CURRENT_DATE,
    status      VARCHAR(20) DEFAULT 'pending'
);


-- Print all table names 
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';
-- +------------+
-- | table_name |
-- +------------+
-- | customers  |
-- | orders     |
-- | products   |
-- +------------+


------------------------------------------------------------------------------------------------------------------

-- BASIC INSERT — single row
INSERT INTO products (name, price, stock)
VALUES ('Mechanical Keyboard', 1299.00, 50);


-- INSERT WITH ALL COLUMNS MENTIONED
INSERT INTO products (name, price, stock, is_active)
VALUES ('Wireless Mouse', 499.00, 30, TRUE);


-- Double quotes = column name in PostgreSQL.
-- Always use single quotes for string values.
INSERT INTO products (name, price, stock)
VALUES ('Monitor', 8999.00, 10);


-- BULK INSERT — multiple rows in one query
INSERT INTO products (name, price, stock, is_active)
VALUES
    ('USB Hub',        299.00,  100, TRUE),
    ('Webcam',         1599.00,  20, TRUE),
    ('Desk Lamp',       449.00,  45, TRUE),
    ('Mouse Pad',        99.00, 200, TRUE),
    ('HDMI Cable',      149.00,  80, TRUE),
    ('Laptop Stand',    899.00,  15, FALSE);


-- RETURNING — get inserted data back immediately
INSERT INTO products (name, price, stock)
VALUES ('Bluetooth Speaker', 2499.00, 25)
RETURNING id, name, created_at;
-- +----+-------------------+----------------------------+
-- | id | name              | created_at                 |
-- +----+-------------------+----------------------------+
-- | 10 | Bluetooth Speaker | 2026-06-17 22:31:00.00868 |
-- +----+-------------------+----------------------------+


-- Return everything using *:
INSERT INTO products (name, price, stock)
VALUES ('Gaming Headset', 3299.00, 12)
RETURNING *;
-- +----+----------------+---------+-------+-----------+----------------------------+
-- | id | name           | price   | stock | is_active | created_at                 |
-- +----+----------------+---------+-------+-----------+----------------------------+
-- | 11 | Gaming Headset | 3299.00 | 12    | true      | 2026-06-17 22:33:16.370779 |
-- +----+----------------+---------+-------+-----------+----------------------------+


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


------------------------------------------------------------------------------------------------------------------

-- INSERT INTO customers table

INSERT INTO customers (first_name, last_name, email, phone, age, city)
VALUES
    ('Akash',   'Sharma',  'akash@gmail.com',   '9876543210', 20, 'Pune'),
    ('Riya',    'Patel',   'riya@gmail.com',    '9812345678', 22, 'Mumbai'),
    ('Rohit',   'Verma',   'rohit@gmail.com',   '9898989898', 25, 'Delhi'),
    ('Sneha',   'Kulkarni','sneha@gmail.com',   '9765432109', 21, 'Nashik'),
    ('Vikram',  'Singh',   'vikram@gmail.com',  '9654321098', 28, 'Bangalore');


/*  --         IF YOU USE THIS COMMAND BELOW 
    --         THIS WILL GIVE YOU ERROR AS :

INSERT INTO customers (first_name, last_name, email, age)
VALUES ('Test', 'User', 'akash@gmail.com', 19);

-- ERROR:  duplicate key value violates unique constraint "customers_email_key"
-- Key (email)=(akash@gmail.com) already exists. 
-- SQL state: 23505
-- Detail: Key (email)=(akash@gmail.com) already exists.



-- ON CONFLICT — handle duplicate gracefully (UPSERT)

INSERT INTO customers (first_name, last_name, email, age)
VALUES ('Akash', 'Sharma', 'akash@gmail.com', 20)
ON CONFLICT (email) DO NOTHING;

-- INSERT 0 0
-- Query returned successfully in 82 msec.


*/


-- To see whole Customers Table :
SELECT * FROM customers;
-- +----+------------+-----------+-------------------+------------+-----+-----------+----------------------------+
-- | id | first_name | last_name | email             | phone      | age | city      | joined_at                  |
-- +----+------------+-----------+-------------------+------------+-----+-----------+----------------------------+
-- | 1  | Akash      | Sharma    | akash@gmail.com   | 9876543210 | 20  | Pune      | 2026-06-17 22:35:13.60936  |
-- | 2  | Riya       | Patel     | riya@gmail.com    | 9812345678 | 22  | Mumbai    | 2026-06-17 22:35:13.60936  |
-- | 3  | Rohit      | Verma     | rohit@gmail.com   | 9898989898 | 25  | Delhi     | 2026-06-17 22:35:13.60936  |
-- | 4  | Sneha      | Kulkarni  | sneha@gmail.com   | 9765432109 | 21  | Nashik    | 2026-06-17 22:35:13.60936  |
-- | 5  | Vikram     | Singh     | vikram@gmail.com  | 9654321098 | 28  | Bangalore | 2026-06-17 22:35:13.60936  |
-- +----+------------+-----------+-------------------+------------+-----+-----------+----------------------------+


------------------------------------------------------------------------------------------------------------------

-- INSERT INTO orders (uses foreign keys)


-- customer_id must exist in customers table
-- product_id must exist in products table
INSERT INTO orders (customer_id, product_id, quantity, status)
VALUES
    (1, 1, 2, 'delivered'),   -- Akash ordered 2 Keyboards
    (1, 2, 1, 'delivered'),   -- Akash ordered 1 Mouse
    (2, 3, 1, 'shipped'),     -- Riya ordered 1 Monitor
    (3, 5, 3, 'pending'),     -- Rohit ordered 3 Webcams
    (4, 7, 1, 'delivered'),   -- Sneha ordered 1 Mouse Pad
    (5, 1, 1, 'pending'),     -- Vikram ordered 1 Keyboard
    (2, 9, 2, 'shipped');     -- Riya ordered 2 Bluetooth Speakers


/*      WHAT HAPPENS WHEN FOREIGN KEY IS VIOLATED

INSERT INTO orders (customer_id, product_id, quantity)
VALUES (99, 1, 1);

ERROR:  insert or update on table "orders" violates foreign key constraint "orders_customer_id_fkey"
Key (customer_id)=(99) is not present in table "customers". 

SQL state: 23503
Detail: Key (customer_id)=(99) is not present in table "customers".

*/


------------------------------------------------------------------------------------------------------------------

-- Count rows in each table:
SELECT 'products'  AS table_name, COUNT(*) AS rows FROM products
UNION ALL
SELECT 'customers' AS table_name, COUNT(*) AS rows FROM customers
UNION ALL
SELECT 'orders'    AS table_name, COUNT(*) AS rows FROM orders;
-- +------------+------+
-- | table_name | rows |
-- +------------+------+
-- | products   | 11   |
-- | customers  | 5    |
-- | orders     | 7    |
-- +------------+------+
